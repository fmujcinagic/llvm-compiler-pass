; ModuleID = 'testcases/basic_aliasing.c'
source_filename = "testcases/basic_aliasing.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !15, !DIExpression(), !20)
    #dbg_declare(ptr %3, !21, !DIExpression(), !23)
  %5 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !24
  %6 = load ptr, ptr @stdin, align 8, !dbg !25
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 50, ptr noundef %6), !dbg !26
  %8 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0, !dbg !27
  store ptr %8, ptr %3, align 8, !dbg !28
    #dbg_declare(ptr %4, !29, !DIExpression(), !30)
  %9 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0, !dbg !31
  %10 = load ptr, ptr %3, align 8, !dbg !32
  %11 = call ptr @strcpy(ptr noundef %9, ptr noundef %10) #3, !dbg !33
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
!1 = !DIFile(filename: "testcases/basic_aliasing.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "6debfe06812b2841fdbe7d62ab8b9eea")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer1", scope: !10, file: !1, line: 5, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 50)
!20 = !DILocation(line: 5, column: 10, scope: !10)
!21 = !DILocalVariable(name: "alias", scope: !10, file: !1, line: 6, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!23 = !DILocation(line: 6, column: 11, scope: !10)
!24 = !DILocation(line: 7, column: 11, scope: !10)
!25 = !DILocation(line: 7, column: 37, scope: !10)
!26 = !DILocation(line: 7, column: 5, scope: !10)
!27 = !DILocation(line: 9, column: 13, scope: !10)
!28 = !DILocation(line: 9, column: 11, scope: !10)
!29 = !DILocalVariable(name: "dest", scope: !10, file: !1, line: 11, type: !16)
!30 = !DILocation(line: 11, column: 10, scope: !10)
!31 = !DILocation(line: 12, column: 12, scope: !10)
!32 = !DILocation(line: 12, column: 18, scope: !10)
!33 = !DILocation(line: 12, column: 5, scope: !10)
!34 = !DILocation(line: 14, column: 5, scope: !10)
