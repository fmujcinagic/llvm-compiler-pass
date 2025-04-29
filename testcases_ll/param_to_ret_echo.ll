; ModuleID = 'testcases/Function Call Propagation/param_to_ret_echo.c'
source_filename = "testcases/Function Call Propagation/param_to_ret_echo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%39s\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @echo(ptr noundef %0) #0 !dbg !17 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !22, !DIExpression(), !23)
  %3 = load ptr, ptr %2, align 8, !dbg !24
  ret ptr %3, !dbg !25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = alloca [40 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca [40 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !30, !DIExpression(), !34)
  %5 = getelementptr inbounds [40 x i8], ptr %2, i64 0, i64 0, !dbg !35
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !36
    #dbg_declare(ptr %3, !37, !DIExpression(), !38)
  %7 = getelementptr inbounds [40 x i8], ptr %2, i64 0, i64 0, !dbg !39
  %8 = call ptr @echo(ptr noundef %7), !dbg !40
  store ptr %8, ptr %3, align 8, !dbg !38
    #dbg_declare(ptr %4, !41, !DIExpression(), !42)
  %9 = getelementptr inbounds [40 x i8], ptr %4, i64 0, i64 0, !dbg !43
  %10 = load ptr, ptr %3, align 8, !dbg !44
  %11 = call ptr @strcpy(ptr noundef %9, ptr noundef %10) #3, !dbg !45
  ret i32 0, !dbg !46
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Function Call Propagation/param_to_ret_echo.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "2fd7eaf9aa906b16c6471f6dda4e1581")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 5)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0}
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 8, !"PIC Level", i32 2}
!13 = !{i32 7, !"PIE Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!17 = distinct !DISubprogram(name: "echo", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !{}
!22 = !DILocalVariable(name: "msg", arg: 1, scope: !17, file: !2, line: 4, type: !20)
!23 = !DILocation(line: 4, column: 18, scope: !17)
!24 = !DILocation(line: 5, column: 12, scope: !17)
!25 = !DILocation(line: 5, column: 5, scope: !17)
!26 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 8, type: !27, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!27 = !DISubroutineType(types: !28)
!28 = !{!29}
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DILocalVariable(name: "user", scope: !26, file: !2, line: 9, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 40)
!34 = !DILocation(line: 9, column: 10, scope: !26)
!35 = !DILocation(line: 10, column: 19, scope: !26)
!36 = !DILocation(line: 10, column: 5, scope: !26)
!37 = !DILocalVariable(name: "copy", scope: !26, file: !2, line: 11, type: !20)
!38 = !DILocation(line: 11, column: 11, scope: !26)
!39 = !DILocation(line: 11, column: 23, scope: !26)
!40 = !DILocation(line: 11, column: 18, scope: !26)
!41 = !DILocalVariable(name: "target", scope: !26, file: !2, line: 12, type: !31)
!42 = !DILocation(line: 12, column: 10, scope: !26)
!43 = !DILocation(line: 13, column: 12, scope: !26)
!44 = !DILocation(line: 13, column: 20, scope: !26)
!45 = !DILocation(line: 13, column: 5, scope: !26)
!46 = !DILocation(line: 14, column: 5, scope: !26)
