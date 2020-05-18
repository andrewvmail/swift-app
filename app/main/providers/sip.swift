import Foundation

enum SipError: Error {
    case libre
    case config
    case stack
    case modules
    case userAgent
    case call
}

final class Sip {

    required init?(agent: inout OpaquePointer?) throws {
        guard libre_init() == 0 else { throw SipError.libre }

        // Initialize dynamic modules.
        mod_init()

        // Make configure file.
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            conf_path_set(path)
        }
        guard conf_configure() == 0 else { throw SipError.config }

        guard baresip_init(conf_config()) == 0 else { print("baresip init error"); return }

        // Initialize the SIP stack.
        print("before ua_init")
        guard ua_init("SIP", 1, 1, 0) == 0 else { throw SipError.stack }
        print("after ua_init")

        // Load modules.
        print("modules")
        guard conf_modules() == 0 else { throw SipError.modules }

        print("after modules")

        let addr = "sip:momo@192.168.50.128:5060;transport=udp;answermode=auto;auth_pass=momo;"


        // Start user agent.
        guard ua_alloc(&agent, addr) == 0 else { throw SipError.userAgent }

        // Make an outgoing call.
        guard ua_connect(agent, nil, nil, "sip:888@192.168.50.128:5060", VIDMODE_OFF) == 0 else { throw SipError.call }

        // Start the main loop.
        re_main(nil)
    }

    func close(agent: OpaquePointer) {
        mem_deref(UnsafeMutablePointer(agent))
        ua_close()
        mod_close()

        // Close and check for memory leaks.
        libre_close()
        tmr_debug()
        mem_debug()
    }

}