(module
    (import "console" "put_image" (func $put_image (param i32 i32 i32)))
    (import "console" "blah" (func $blah))
    (import "js" "mem" (memory 16))
    (func (export "abc") (result i32)
        (local $x i32)
        (local $y i32)
        (local $zx f32)
        (local $zy f32)
        (local $cx f32)
        (local $cy f32)
        (local $it i32)
        i32.const 0
        set_local $y
        block $yblock
            loop $yloop
                i32.const 0
                set_local $x
                block $xblock
                    loop $xloop
                        get_local $x
                        f32.convert_i32_u
                        f32.const 0.0078125
                        f32.mul
                        f32.const -2
                        f32.add
                        set_local $cx

                        get_local $y
                        f32.convert_i32_u
                        f32.const 0.0078125
                        f32.mul
                        f32.const -2
                        f32.add
                        set_local $cy

                        f32.const 0
                        set_local $zx
                        f32.const 0
                        set_local $zy
                        i32.const 0
                        set_local $it

                        block $iblock
                            loop $iloop
                                get_local $zx
                                get_local $zx
                                f32.mul
                                get_local $zy
                                get_local $zy
                                f32.mul
                                f32.sub
                                get_local $cx
                                f32.add
                                
                                get_local $zx
                                get_local $zy
                                f32.mul
                                f32.const 2
                                f32.mul
                                get_local $cy
                                f32.add
                                
                                set_local $zy
                                set_local $zx

                                get_local $zx
                                get_local $zx
                                f32.mul
                                get_local $zy
                                get_local $zy
                                f32.mul
                                f32.add
                                f32.const 4
                                f32.gt
                                br_if $iblock
                            
                                get_local $it
                                i32.const 1
                                i32.add
                                set_local $it
                                
                                get_local $it
                                i32.const 512
                                i32.eq
                                br_if $iblock
                                br $iloop
                            end $iloop
                        end $iblock

                        get_local $x
                        get_local $y
                        i32.const 512
                        i32.mul
                        i32.add
                        i32.const 4
                        i32.mul

                        get_local $it
                        i32.const 0xff000000
                        i32.add
                        i32.store

                        get_local $x
                        i32.const 1
                        i32.add
                        set_local $x

                        get_local $x
                        i32.const 512
                        i32.eq
                        br_if $xblock
                        br $xloop
                    end $xloop
                end $xblock

                get_local $y
                i32.const 1
                i32.add
                set_local $y

                get_local $y
                i32.const 512
                i32.eq
                br_if $yblock
                br $yloop
            end $yloop
        end $yblock
        i32.const 0
        i32.const 512
        i32.const 512
        call $put_image
        get_local $x
        return
    )
)
