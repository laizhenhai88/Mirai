; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -S -globals-aa -early-cse-memssa | FileCheck %s

define i16 @f1() readonly {
  ret i16 0
}

declare void @f2()

; Check that EarlyCSE correctly handles function calls that don't have
; a MemoryAccess.  In this case the calls to @f1 have no
; MemoryAccesses since globals-aa determines that @f1 doesn't
; read/write memory at all.

define void @f3() {
; CHECK-LABEL: @f3(
; CHECK-NEXT:    [[CALL1:%.*]] = call i16 @f1()
; CHECK-NEXT:    call void @f2()
; CHECK-NEXT:    ret void
;
  %call1 = call i16 @f1()
  call void @f2()
  %call2 = call i16 @f1()
  ret void
}