; ModuleID = 'testcases/Pointer Propagation/structs_and_pointers.c'
source_filename = "testcases/Pointer Propagation/structs_and_pointers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Wrapper = type { ptr }

@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca %struct.Wrapper, align 8
  %4 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !15, !DIExpression(), !20)
  %5 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0, !dbg !21
  %6 = load ptr, ptr @stdin, align 8, !dbg !22
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 100, ptr noundef %6), !dbg !23
    #dbg_declare(ptr %3, !24, !DIExpression(), !30)
  %8 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0, !dbg !31
  %9 = getelementptr inbounds %struct.Wrapper, ptr %3, i32 0, i32 0, !dbg !32
  store ptr %8, ptr %9, align 8, !dbg !33
    #dbg_declare(ptr %4, !34, !DIExpression(), !35)
  %10 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0, !dbg !36
  %11 = getelementptr inbounds %struct.Wrapper, ptr %3, i32 0, i32 0, !dbg !37
  %12 = load ptr, ptr %11, align 8, !dbg !37
  %13 = call ptr @strcpy(ptr noundef %10, ptr noundef %12) #3, !dbg !38
  ret i32 0, !dbg !39
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
!1 = !DIFile(filename: "testcases/Pointer Propagation/structs_and_pointers.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "f35e1e758cd656d6b27c8d76870ac483")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "input", scope: !10, file: !1, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !DILocation(line: 9, column: 10, scope: !10)
!21 = !DILocation(line: 10, column: 11, scope: !10)
!22 = !DILocation(line: 10, column: 33, scope: !10)
!23 = !DILocation(line: 10, column: 5, scope: !10)
!24 = !DILocalVariable(name: "bw", scope: !10, file: !1, line: 12, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "Wrapper", file: !1, line: 6, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !26, file: !1, line: 5, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!30 = !DILocation(line: 12, column: 13, scope: !10)
!31 = !DILocation(line: 13, column: 14, scope: !10)
!32 = !DILocation(line: 13, column: 8, scope: !10)
!33 = !DILocation(line: 13, column: 12, scope: !10)
!34 = !DILocalVariable(name: "temp", scope: !10, file: !1, line: 15, type: !16)
!35 = !DILocation(line: 15, column: 10, scope: !10)
!36 = !DILocation(line: 16, column: 12, scope: !10)
!37 = !DILocation(line: 16, column: 21, scope: !10)
!38 = !DILocation(line: 16, column: 5, scope: !10)
!39 = !DILocation(line: 18, column: 5, scope: !10)
