# LambdaTest

This is an attempt to call an AWS Lambda function from a Swift program.
The code is a simplified version of a real-life utility calling a specific
lambda function. The code builds with Swift-5 and Swift-6 in macOS and Linux
(Ubutu 22.04 amd64 and Ubuntu 24.04 aarch64), but fails to build on Linux
with Swift-6 (Ubuntu 22.04 amd64 and Ubuntu 24.04 aarch64).

Build fails while building the `aws-crt-swift` module.

<table>
    <thead>
    <tr>
        <td colspan=2 style="text-align:center">
            Test Conditions
        </td>
    <tr>
    </thead>
    <tr>
        <th>Swift Version</th>
        <td>release/6.0 branch from Aug 13th</td>
    </tr>
    <tr>
        <th>Linux Version</th>
        <td>Ubuntu 24.04 aarch64 on Raspberry Pi 5</td>
    </tr>
</table>


```bash
/opt/swift-6/usr/bin/swift build
Building for debugging...
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:85:103: error: incomplete definition of type 'struct openssl_hmac_ctx_table'
   85 |         (int (*)(HMAC_CTX *, const void *, int, const EVP_MD *, ENGINE *))g_aws_openssl_hmac_ctx_table->impl.init_ex_fn;
      |                                                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:29:15: note: forward declaration of 'struct openssl_hmac_ctx_table'
   29 | static struct openssl_hmac_ctx_table hmac_ctx_table;
      |               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:108:37: error: incomplete definition of type 'struct openssl_hmac_ctx_table'
  108 |         g_aws_openssl_hmac_ctx_table->init_fn != s_hmac_ctx_init_noop &&
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:173:63: note: expanded from macro 'AWS_PRECONDITION'
  173 | #define AWS_PRECONDITION(...) CALL_OVERLOAD(AWS_PRECONDITION, __VA_ARGS__)
      |                                                               ^~~~~~~~~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/macros.h:54:92: note: expanded from macro 'CALL_OVERLOAD'
   54 | #define CALL_OVERLOAD(name, ...) GLUE(OVERLOAD_MACRO(name, COUNT_ARGS_MAX5(__VA_ARGS__)), (__VA_ARGS__))
      |                                                                                            ^~~~~~~~~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/macros.h:44:22: note: expanded from macro 'GLUE'
   44 | #define GLUE(x, y) x y
      |                      ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:118:48: note: expanded from macro 'AWS_PRECONDITION1'
  118 | #    define AWS_PRECONDITION1(cond) AWS_ASSERT(cond)
      |                                                ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:64:47: note: expanded from macro 'AWS_ASSERT'
   64 | #    define AWS_ASSERT(cond) AWS_FATAL_ASSERT(cond)
      |                                               ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:87:23: note: expanded from macro 'AWS_FATAL_ASSERT'
   87 |                 if (!(cond)) {                                                                                         \
      |                       ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:29:15: note: forward declaration of 'struct openssl_hmac_ctx_table'
   29 | static struct openssl_hmac_ctx_table hmac_ctx_table;
      |               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:112:33: error: incomplete definition of type 'struct openssl_hmac_ctx_table'
  112 |     g_aws_openssl_hmac_ctx_table->init_fn(ctx);
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:29:15: note: forward declaration of 'struct openssl_hmac_ctx_table'
   29 | static struct openssl_hmac_ctx_table hmac_ctx_table;
      |               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:120:37: error: incomplete definition of type 'struct openssl_hmac_ctx_table'
  120 |         g_aws_openssl_hmac_ctx_table->clean_up_fn != s_hmac_ctx_clean_up_noop &&
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:173:63: note: expanded from macro 'AWS_PRECONDITION'
  173 | #define AWS_PRECONDITION(...) CALL_OVERLOAD(AWS_PRECONDITION, __VA_ARGS__)
      |                                                               ^~~~~~~~~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/macros.h:54:92: note: expanded from macro 'CALL_OVERLOAD'
   54 | #define CALL_OVERLOAD(name, ...) GLUE(OVERLOAD_MACRO(name, COUNT_ARGS_MAX5(__VA_ARGS__)), (__VA_ARGS__))
      |                                                                                            ^~~~~~~~~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/macros.h:44:22: note: expanded from macro 'GLUE'
   44 | #define GLUE(x, y) x y
      |                      ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:118:48: note: expanded from macro 'AWS_PRECONDITION1'
  118 | #    define AWS_PRECONDITION1(cond) AWS_ASSERT(cond)
      |                                                ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:64:47: note: expanded from macro 'AWS_ASSERT'
   64 | #    define AWS_ASSERT(cond) AWS_FATAL_ASSERT(cond)
      |                                               ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-common/include/aws/common/assert.h:87:23: note: expanded from macro 'AWS_FATAL_ASSERT'
   87 |                 if (!(cond)) {                                                                                         \
      |                       ^~~~
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:29:15: note: forward declaration of 'struct openssl_hmac_ctx_table'
   29 | static struct openssl_hmac_ctx_table hmac_ctx_table;
      |               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:122:33: error: incomplete definition of type 'struct openssl_hmac_ctx_table'
  122 |     g_aws_openssl_hmac_ctx_table->clean_up_fn(ctx);
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:29:15: note: forward declaration of 'struct openssl_hmac_ctx_table'
   29 | static struct openssl_hmac_ctx_table hmac_ctx_table;
      |               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:138:5: error: use of undeclared identifier 'hmac_ctx_init'
  138 |     hmac_ctx_init init_fn = (hmac_ctx_init)HMAC_CTX_init;
      |     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:139:5: error: use of undeclared identifier 'hmac_ctx_clean_up'
  139 |     hmac_ctx_clean_up clean_up_fn = (hmac_ctx_clean_up)HMAC_CTX_cleanup;
      |     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:140:5: error: use of undeclared identifier 'hmac_update'
  140 |     hmac_update update_fn = (hmac_update)HMAC_Update;
      |     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:141:5: error: use of undeclared identifier 'hmac_final'
  141 |     hmac_final final_fn = (hmac_final)HMAC_Final;
      |     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:142:5: error: use of undeclared identifier 'hmac_init_ex'
  142 |     hmac_init_ex init_ex_fn = (hmac_init_ex)HMAC_Init_ex;
      |     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:145:28: error: use of undeclared identifier 'init_fn'
  145 |     bool has_102_symbols = init_fn && clean_up_fn && update_fn && final_fn && init_ex_fn;
      |                            ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:145:39: error: use of undeclared identifier 'clean_up_fn'
  145 |     bool has_102_symbols = init_fn && clean_up_fn && update_fn && final_fn && init_ex_fn;
      |                                       ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:145:54: error: use of undeclared identifier 'update_fn'
  145 |     bool has_102_symbols = init_fn && clean_up_fn && update_fn && final_fn && init_ex_fn;
      |                                                      ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:145:67: error: use of undeclared identifier 'final_fn'
  145 |     bool has_102_symbols = init_fn && clean_up_fn && update_fn && final_fn && init_ex_fn;
      |                                                                   ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:145:79: error: use of undeclared identifier 'init_ex_fn'
  145 |     bool has_102_symbols = init_fn && clean_up_fn && update_fn && final_fn && init_ex_fn;
      |                                                                               ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:150:21: error: use of undeclared identifier 'init_fn'
  150 |         *(void **)(&init_fn) = dlsym(module, "HMAC_CTX_init");
      |                     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:151:21: error: use of undeclared identifier 'clean_up_fn'
  151 |         *(void **)(&clean_up_fn) = dlsym(module, "HMAC_CTX_cleanup");
      |                     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:152:21: error: use of undeclared identifier 'update_fn'
  152 |         *(void **)(&update_fn) = dlsym(module, "HMAC_Update");
      |                     ^
.../LambdaTest/.build/checkouts/aws-crt-swift/aws-common-runtime/aws-c-cal/source/unix/openssl_platform_init.c:153:21: error: use of undeclared identifier 'final_fn'
  153 |         *(void **)(&final_fn) = dlsym(module, "HMAC_Final");
      |                     ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
[4/426] Compiling openssl_rsa.c
```