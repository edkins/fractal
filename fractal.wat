(module
    (import "console" "put_image" (func $put_image (param i32 i32 i32)))
    (import "js" "mem" (memory 16))
    (func (export "abc") (param $scalex f64) (param $scaley f64) (param $offsetx f64) (param $offsety f64)
        (local $x i32)
        (local $y i32)
        (local $zx f64)
        (local $zy f64)
        (local $cx f64)
        (local $cy f64)
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
                        f64.convert_i32_u
                        get_local $scalex
                        f64.mul
                        get_local $offsetx
                        f64.add
                        set_local $cx

                        get_local $y
                        f64.convert_i32_u
                        get_local $scaley
                        f64.mul
                        get_local $offsety
                        f64.add
                        set_local $cy

                        f64.const 0
                        set_local $zx
                        f64.const 0
                        set_local $zy
                        i32.const 0
                        set_local $it

                        block $iblock
                            loop $iloop
                                get_local $zx
                                get_local $zx
                                f64.mul
                                get_local $zy
                                get_local $zy
                                f64.mul
                                f64.sub
                                get_local $cx
                                f64.add
                                
                                get_local $zx
                                get_local $zy
                                f64.mul
                                f64.const 2
                                f64.mul
                                get_local $cy
                                f64.add
                                
                                set_local $zy
                                set_local $zx

                                get_local $zx
                                get_local $zx
                                f64.mul
                                get_local $zy
                                get_local $zy
                                f64.mul
                                f64.add
                                f64.const 4
                                f64.gt
                                br_if $iblock
                            
                                get_local $it
                                i32.const 1
                                i32.add
                                set_local $it
                                
                                get_local $it
                                i32.const 5120
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
    )
)
