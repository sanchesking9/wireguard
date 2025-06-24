import Foundation
import WireGuardKit
import WireGuardKitTunnel
import React

@objc(RNWireguard)
class RNWireguard: NSObject {

  private var tunnel: TunnelContainer?

  @objc(_connect:session:resolver:rejecter:)
  func _connect(config: String, session: String,
                resolver: @escaping RCTPromiseResolveBlock,
                rejecter: @escaping RCTPromiseRejectBlock) {
    do {
      let wgConfig = try WgQuickConfigText(configText: config)
      let tunnelConfig = wgConfig.asTunnelConfiguration()
      tunnel = try TunnelContainer(tunnelConfiguration: tunnelConfig)
      try tunnel?.start()
      resolver(true)
    } catch {
      rejecter("CONNECT_ERROR", "Failed to connect", error)
    }
  }

  @objc(_disconnect:rejecter:)
  func _disconnect(_ resolve: RCTPromiseResolveBlock,
                   rejecter: RCTPromiseRejectBlock) {
    do {
      try tunnel?.stop()
      tunnel = nil
      resolve(true)
    } catch {
      rejecter("DISCONNECT_ERROR", "Failed to disconnect", error)
    }
  }

  @objc(_status:)
  func _status(_ resolve: RCTPromiseResolveBlock) {
    resolve(tunnel != nil)
  }

  @objc(_version:)
  func _version(_ resolve: RCTPromiseResolveBlock) {
    resolve("iOS-WireGuardKit-1.0")
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return false
  }

  @objc var EV_TYPE_EXCEPTION: String { return "EV_TYPE_EXCEPTION" }
  @objc var EV_TYPE_REGULAR: String { return "EV_TYPE_REGULAR" }
  @objc var EV_REVOKED: String { return "EV_REVOKED" }
  @objc var EV_HOST_DESTROYED: String { return "EV_HOST_DESTROYED" }
  @objc var EV_HOST_RESUMED: String { return "EV_HOST_RESUMED" }
  @objc var EV_HOST_PAUSED: String { return "EV_HOST_PAUSED" }
}
