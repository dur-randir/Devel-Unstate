#define PERL_NO_GET_CONTEXT

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

STATIC Perl_check_t old_checker = 0;

STATIC OP*
pp_not_once(pTHX) {
    return cLOGOP->op_other;
}

STATIC OP*
sassign_checker(pTHX_ OP *o) {
    o = old_checker(aTHX_ o);

    if (o->op_type == OP_NULL && o->op_next) {
        OP* next = o->op_next;

        if (next->op_next && next->op_next->op_type == OP_ONCE) {
            next->op_next->op_ppaddr = pp_not_once;
        }
    }

    return o;
}

STATIC void
compat_wrap_op_checker(Optype opcode, Perl_check_t new_checker, Perl_check_t *old_checker_p) {
#ifdef USE_ITHREADS
    MUTEX_LOCK(&PL_my_ctx_mutex);
#endif

    if (!*old_checker_p) {
        *old_checker_p = PL_check[opcode];
        PL_check[opcode] = new_checker;
    }

#ifdef USE_ITHREADS
    MUTEX_UNLOCK(&PL_my_ctx_mutex);
#endif
}

MODULE = Test::NoState      PACKAGE = Test::NoState
PROTOTYPES: DISABLE

BOOT:
{
    compat_wrap_op_checker(OP_SASSIGN, sassign_checker, &old_checker);
}

