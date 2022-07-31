import AVFoundation
import Cocoa

let testTime = CMTime(value: 1, timescale: 1000)

print(testTime.seconds, "time")
print(testTime.timescale, "time")
print("\n")


let testTime2 = CMTime(value: 1, timescale: CMTimeScale(USEC_PER_SEC))
print(testTime2.seconds, "time")
print(testTime2.timescale, "time")
