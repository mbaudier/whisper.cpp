# Workaround for GGML macro removed between v0.9.4 and v0.9.5
# until whisper.cpp is updated from v1.8.2
add_compile_definitions(GGML_KQ_MASK_PAD=64)
