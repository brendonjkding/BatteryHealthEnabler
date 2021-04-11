#import <substrate.h>

%hook PLModelingUtilities
+(BOOL)isiPhone{
    for(NSString* symbol in [NSThread  callStackSymbols]){
        if([symbol containsString:@"BatteryUsageUI"]){
            return YES;
        }
    }
    return %orig;
}
%end //PLModelingUtilities

%hook BatteryUIResourceClass
// 2 Peak Performance
// 1 Protected Performance
// 0 Unavailable
+(int)getManagementState{
    return 2;
}
// iPad
+(int)getBatteryHealthServiceState{
    return 0;
}
%end //BatteryUIResourceClass

%hook BatteryHealthUIController
-(void)updateSmartChargingState{
    MSHookIvar<unsigned long long>(self,"_smartChargingState") = 0;
}

// iPad
-(void)updateBatteryHealthServiceState{
    MSHookIvar<int>(self,"_batteryHealthServiceState") = 0;
}
%end //BatteryHealthUIController

%ctor{
    [[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/PowerLog.framework"] load];
    [[NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/BatteryUsageUI.bundle"] load];
    %init;
}