#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_5C2751F9F8B4476CA41E038568F5D9E2(void *, void *);
void MREP_074CE6F8D7B04557AAA75D0D23F3A0D6(void *, void *);
void MREP_15A6D2A746DB437A9D4B9699548C4E22(void *, void *);
void MREP_50325C8AE788434AB4E1C47D303EE4CE(void *, void *);
void MREP_6BC70F9625C24AC6B465C71E7B5E0B72(void *, void *);
void MREP_42CCA07151DC40A4A0A3581CC4F57051(void *, void *);
void MREP_AB111B30A31E41C09C8CE8E6AEC642E3(void *, void *);
void MREP_8EDCE40B02284FA883979287F36E0575(void *, void *);
void MREP_C0848A440B994A28B405F3EDB81E6D6F(void *, void *);
void MREP_22600E9258084D2381EDA69A80776A25(void *, void *);
void MREP_FF26958D5EFF4893B2664B5932C9D1C3(void *, void *);
void MREP_240EC182CA8A41EC89F91719518051A6(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_5C2751F9F8B4476CA41E038568F5D9E2(self, 0);
MREP_074CE6F8D7B04557AAA75D0D23F3A0D6(self, 0);
MREP_15A6D2A746DB437A9D4B9699548C4E22(self, 0);
MREP_50325C8AE788434AB4E1C47D303EE4CE(self, 0);
MREP_6BC70F9625C24AC6B465C71E7B5E0B72(self, 0);
MREP_42CCA07151DC40A4A0A3581CC4F57051(self, 0);
MREP_AB111B30A31E41C09C8CE8E6AEC642E3(self, 0);
MREP_8EDCE40B02284FA883979287F36E0575(self, 0);
MREP_C0848A440B994A28B405F3EDB81E6D6F(self, 0);
MREP_22600E9258084D2381EDA69A80776A25(self, 0);
MREP_FF26958D5EFF4893B2664B5932C9D1C3(self, 0);
MREP_240EC182CA8A41EC89F91719518051A6(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
