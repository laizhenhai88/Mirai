; RUN: llc -march=hexagon < %s | FileCheck %s

; --- Byte

; CHECK-LABEL: test_00:
; CHECK: q[[Q000:[0-3]]] = vcmp.eq(v0.b,v1.b)
; CHECK: v0 = vmux(q[[Q000]],v0,v1)
define <128 x i8> @test_00(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp eq <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_01:
; CHECK: q[[Q010:[0-3]]] = vcmp.eq(v0.b,v1.b)
; CHECK: q[[Q011:[0-9]]] = not(q[[Q010]])
; CHECK: v0 = vmux(q[[Q011]],v0,v1)
define <128 x i8> @test_01(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp ne <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_02:
; CHECK: q[[Q020:[0-3]]] = vcmp.gt(v1.b,v0.b)
; CHECK: v0 = vmux(q[[Q020]],v0,v1)
define <128 x i8> @test_02(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp slt <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_03:
; CHECK: q[[Q030:[0-3]]] = vcmp.gt(v0.b,v1.b)
; CHECK: q[[Q031:[0-9]]] = not(q[[Q030]])
; CHECK: v0 = vmux(q[[Q031]],v0,v1)
define <128 x i8> @test_03(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp sle <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_04:
; CHECK: q[[Q040:[0-3]]] = vcmp.gt(v0.b,v1.b)
; CHECK: v0 = vmux(q[[Q040]],v0,v1)
define <128 x i8> @test_04(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp sgt <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_05:
; CHECK: q[[Q050:[0-3]]] = vcmp.gt(v1.b,v0.b)
; CHECK: q[[Q051:[0-9]]] = not(q[[Q050]])
; CHECK: v0 = vmux(q[[Q051]],v0,v1)
define <128 x i8> @test_05(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp sge <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_06:
; CHECK: q[[Q060:[0-3]]] = vcmp.gt(v1.ub,v0.ub)
; CHECK: v0 = vmux(q[[Q060]],v0,v1)
define <128 x i8> @test_06(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp ult <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_07:
; CHECK: q[[Q070:[0-3]]] = vcmp.gt(v0.ub,v1.ub)
; CHECK: q[[Q071:[0-9]]] = not(q[[Q070]])
; CHECK: v0 = vmux(q[[Q071]],v0,v1)
define <128 x i8> @test_07(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp ule <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_08:
; CHECK: q[[Q080:[0-3]]] = vcmp.gt(v0.ub,v1.ub)
; CHECK: v0 = vmux(q[[Q080]],v0,v1)
define <128 x i8> @test_08(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp ugt <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; CHECK-LABEL: test_09:
; CHECK: q[[Q090:[0-3]]] = vcmp.gt(v1.ub,v0.ub)
; CHECK: q[[Q091:[0-9]]] = not(q[[Q090]])
; CHECK: v0 = vmux(q[[Q091]],v0,v1)
define <128 x i8> @test_09(<128 x i8> %v0, <128 x i8> %v1) #0 {
  %t0 = icmp uge <128 x i8> %v0, %v1
  %t1 = select <128 x i1> %t0, <128 x i8> %v0, <128 x i8> %v1
  ret <128 x i8> %t1
}

; --- Half

; CHECK-LABEL: test_10:
; CHECK: q[[Q100:[0-3]]] = vcmp.eq(v0.h,v1.h)
; CHECK: v0 = vmux(q[[Q100]],v0,v1)
define <64 x i16> @test_10(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp eq <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_11:
; CHECK: q[[Q110:[0-3]]] = vcmp.eq(v0.h,v1.h)
; CHECK: q[[Q111:[0-9]]] = not(q[[Q110]])
; CHECK: v0 = vmux(q[[Q111]],v0,v1)
define <64 x i16> @test_11(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp ne <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_12:
; CHECK: q[[Q120:[0-3]]] = vcmp.gt(v1.h,v0.h)
; CHECK: v0 = vmux(q[[Q120]],v0,v1)
define <64 x i16> @test_12(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp slt <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_13:
; CHECK: q[[Q130:[0-3]]] = vcmp.gt(v0.h,v1.h)
; CHECK: q[[Q131:[0-9]]] = not(q[[Q130]])
; CHECK: v0 = vmux(q[[Q031]],v0,v1)
define <64 x i16> @test_13(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp sle <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_14:
; CHECK: q[[Q140:[0-3]]] = vcmp.gt(v0.h,v1.h)
; CHECK: v0 = vmux(q[[Q140]],v0,v1)
define <64 x i16> @test_14(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp sgt <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_15:
; CHECK: q[[Q150:[0-3]]] = vcmp.gt(v1.h,v0.h)
; CHECK: q[[Q151:[0-9]]] = not(q[[Q150]])
; CHECK: v0 = vmux(q[[Q151]],v0,v1)
define <64 x i16> @test_15(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp sge <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_16:
; CHECK: q[[Q160:[0-3]]] = vcmp.gt(v1.uh,v0.uh)
; CHECK: v0 = vmux(q[[Q160]],v0,v1)
define <64 x i16> @test_16(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp ult <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_17:
; CHECK: q[[Q170:[0-3]]] = vcmp.gt(v0.uh,v1.uh)
; CHECK: q[[Q171:[0-9]]] = not(q[[Q170]])
; CHECK: v0 = vmux(q[[Q171]],v0,v1)
define <64 x i16> @test_17(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp ule <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_18:
; CHECK: q[[Q180:[0-3]]] = vcmp.gt(v0.uh,v1.uh)
; CHECK: v0 = vmux(q[[Q180]],v0,v1)
define <64 x i16> @test_18(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp ugt <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; CHECK-LABEL: test_19:
; CHECK: q[[Q190:[0-3]]] = vcmp.gt(v1.uh,v0.uh)
; CHECK: q[[Q191:[0-9]]] = not(q[[Q190]])
; CHECK: v0 = vmux(q[[Q191]],v0,v1)
define <64 x i16> @test_19(<64 x i16> %v0, <64 x i16> %v1) #0 {
  %t0 = icmp uge <64 x i16> %v0, %v1
  %t1 = select <64 x i1> %t0, <64 x i16> %v0, <64 x i16> %v1
  ret <64 x i16> %t1
}

; --- Word

; CHECK-LABEL: test_20:
; CHECK: q[[Q200:[0-3]]] = vcmp.eq(v0.w,v1.w)
; CHECK: v0 = vmux(q[[Q200]],v0,v1)
define <32 x i32> @test_20(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp eq <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_21:
; CHECK: q[[Q210:[0-3]]] = vcmp.eq(v0.w,v1.w)
; CHECK: q[[Q211:[0-9]]] = not(q[[Q210]])
; CHECK: v0 = vmux(q[[Q211]],v0,v1)
define <32 x i32> @test_21(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp ne <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_22:
; CHECK: q[[Q220:[0-3]]] = vcmp.gt(v1.w,v0.w)
; CHECK: v0 = vmux(q[[Q220]],v0,v1)
define <32 x i32> @test_22(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp slt <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_23:
; CHECK: q[[Q230:[0-3]]] = vcmp.gt(v0.w,v1.w)
; CHECK: q[[Q231:[0-9]]] = not(q[[Q230]])
; CHECK: v0 = vmux(q[[Q031]],v0,v1)
define <32 x i32> @test_23(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp sle <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_24:
; CHECK: q[[Q240:[0-3]]] = vcmp.gt(v0.w,v1.w)
; CHECK: v0 = vmux(q[[Q240]],v0,v1)
define <32 x i32> @test_24(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp sgt <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_25:
; CHECK: q[[Q250:[0-3]]] = vcmp.gt(v1.w,v0.w)
; CHECK: q[[Q251:[0-9]]] = not(q[[Q250]])
; CHECK: v0 = vmux(q[[Q251]],v0,v1)
define <32 x i32> @test_25(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp sge <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_26:
; CHECK: q[[Q260:[0-3]]] = vcmp.gt(v1.uw,v0.uw)
; CHECK: v0 = vmux(q[[Q260]],v0,v1)
define <32 x i32> @test_26(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp ult <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_27:
; CHECK: q[[Q270:[0-3]]] = vcmp.gt(v0.uw,v1.uw)
; CHECK: q[[Q271:[0-9]]] = not(q[[Q270]])
; CHECK: v0 = vmux(q[[Q271]],v0,v1)
define <32 x i32> @test_27(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp ule <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_28:
; CHECK: q[[Q280:[0-3]]] = vcmp.gt(v0.uw,v1.uw)
; CHECK: v0 = vmux(q[[Q280]],v0,v1)
define <32 x i32> @test_28(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp ugt <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

; CHECK-LABEL: test_29:
; CHECK: q[[Q290:[0-3]]] = vcmp.gt(v1.uw,v0.uw)
; CHECK: q[[Q291:[0-9]]] = not(q[[Q290]])
; CHECK: v0 = vmux(q[[Q291]],v0,v1)
define <32 x i32> @test_29(<32 x i32> %v0, <32 x i32> %v1) #0 {
  %t0 = icmp uge <32 x i32> %v0, %v1
  %t1 = select <32 x i1> %t0, <32 x i32> %v0, <32 x i32> %v1
  ret <32 x i32> %t1
}

attributes #0 = { nounwind readnone "target-cpu"="hexagonv60" "target-features"="+hvx,+hvx-length128b" }
