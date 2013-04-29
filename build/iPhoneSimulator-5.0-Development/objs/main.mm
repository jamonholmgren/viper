#import <UIKit/UIKit.h>

extern "C" {
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
    void RubyMotionInit(int argc, char **argv);
void MREP_BAE1F619EC464FF8BB258671A0CCCC81(void *, void *);
void MREP_3A677C2DD7D14BDB86CDBDA6D80D9DE7(void *, void *);
void MREP_1207B57AD5E64C30BD4DBC8DB00E1F66(void *, void *);
void MREP_AF6321F93EA4486FA2E043E2AFE2E0BA(void *, void *);
void MREP_1EA873B15F554B09999B704EB0C4D3B8(void *, void *);
void MREP_B3D5921790794957956C29FA63859A9A(void *, void *);
void MREP_09EC4391FA054867B4F12E99AC8AC81D(void *, void *);
}
@interface SpecLauncher : NSObject
@end

#include <dlfcn.h>

@implementation SpecLauncher

+ (id)launcher
{
    [UIApplication sharedApplication];

    // Enable simulator accessibility.
    // Thanks http://www.stewgleadow.com/blog/2011/10/14/enabling-accessibility-for-ios-applications/
    NSString *simulatorRoot = [[[NSProcessInfo processInfo] environment] objectForKey:@"IPHONE_SIMULATOR_ROOT"];
    if (simulatorRoot != nil) {
        void *appSupportLibrary = dlopen([[simulatorRoot stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport"] fileSystemRepresentation], RTLD_LAZY);
        CFStringRef (*copySharedResourcesPreferencesDomainForDomain)(CFStringRef domain) = (CFStringRef (*)(CFStringRef)) dlsym(appSupportLibrary, "CPCopySharedResourcesPreferencesDomainForDomain");

        if (copySharedResourcesPreferencesDomainForDomain != NULL) {
            CFStringRef accessibilityDomain = copySharedResourcesPreferencesDomainForDomain(CFSTR("com.apple.Accessibility"));

            if (accessibilityDomain != NULL) {
                CFPreferencesSetValue(CFSTR("ApplicationAccessibilityEnabled"), kCFBooleanTrue, accessibilityDomain, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
                CFRelease(accessibilityDomain);
            }
        }
    }

    // Load the UIAutomation framework.
    dlopen("/Developer/Library/PrivateFrameworks/UIAutomation.framework/UIAutomation", RTLD_LOCAL);

    SpecLauncher *launcher = [[self alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:launcher selector:@selector(appLaunched:) name:UIApplicationDidBecomeActiveNotification object:nil];
    return launcher; 
}

- (void)appLaunched:(id)notification
{
    // Give a bit of time for the simulator to attach...
    [self performSelector:@selector(runSpecs) withObject:nil afterDelay:0.3];
}

- (void)runSpecs
{
MREP_BAE1F619EC464FF8BB258671A0CCCC81(self, 0);
MREP_3A677C2DD7D14BDB86CDBDA6D80D9DE7(self, 0);
MREP_1207B57AD5E64C30BD4DBC8DB00E1F66(self, 0);
MREP_AF6321F93EA4486FA2E043E2AFE2E0BA(self, 0);
MREP_1EA873B15F554B09999B704EB0C4D3B8(self, 0);
MREP_B3D5921790794957956C29FA63859A9A(self, 0);
MREP_09EC4391FA054867B4F12E99AC8AC81D(self, 0);
[NSClassFromString(@"Bacon") performSelector:@selector(run)];
}

@end
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retval = 0;
    try {
[SpecLauncher launcher];
        RubyMotionInit(argc, argv);
rb_define_global_const("RUBYMOTION_ENV", @"test");
rb_define_global_const("RUBYMOTION_VERSION", @"1.35");
        retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
        rb_exit(retval);
    }
    catch (...) {
	rb_rb2oc_exc_handler();
    }
    [pool release];
    return retval;
}
