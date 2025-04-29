; ModuleID = 'testcases/Pointer Propagation/unions_and_pointers.c'
source_filename = "testcases/Pointer Propagation/unions_and_pointers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.DontTrustThisUnion = type { ptr, [96 x i8] }

@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca %union.DontTrustThisUnion, align 8
  %3 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !15, !DIExpression(), !25)
  %4 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0, !dbg !26
  %5 = load ptr, ptr @stdin, align 8, !dbg !27
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 100, ptr noundef %5), !dbg !28
    #dbg_declare(ptr %3, !29, !DIExpression(), !30)
  %7 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !31
  %8 = load ptr, ptr %2, align 8, !dbg !32
  %9 = call ptr @strcpy(ptr noundef %7, ptr noundef %8) #3, !dbg !33
  ret i32 0, !dbg !34
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "testcases/Pointer Propagation/unions_and_pointers.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "19aaba39adc2afead99b33860f30b0d1")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "critical_union", scope: !10, file: !1, line: 10, type: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "DontTrustThisUnion", file: !1, line: 4, size: 832, elements: !17)
!17 = !{!18, !21}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "alias", scope: !16, file: !1, line: 5, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !16, file: !1, line: 6, baseType: !22, size: 800)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 10, column: 30, scope: !10)
!26 = !DILocation(line: 12, column: 11, scope: !10)
!27 = !DILocation(line: 12, column: 65, scope: !10)
!28 = !DILocation(line: 12, column: 5, scope: !10)
!29 = !DILocalVariable(name: "temp", scope: !10, file: !1, line: 14, type: !22)
!30 = !DILocation(line: 14, column: 10, scope: !10)
!31 = !DILocation(line: 15, column: 12, scope: !10)
!32 = !DILocation(line: 15, column: 33, scope: !10)
!33 = !DILocation(line: 15, column: 5, scope: !10)
!34 = !DILocation(line: 17, column: 5, scope: !10)
