; ModuleID = 'testcases/Function Call Propagation/recursive_funcs.c'
source_filename = "testcases/Function Call Propagation/recursive_funcs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%23s\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @rec(i32 noundef %0, ptr noundef %1) #0 !dbg !17 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !23, !DIExpression(), !24)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !25, !DIExpression(), !26)
  %6 = load i32, ptr %4, align 4, !dbg !27
  %7 = icmp eq i32 %6, 0, !dbg !29
  br i1 %7, label %8, label %10, !dbg !30

8:                                                ; preds = %2
  %9 = load ptr, ptr %5, align 8, !dbg !31
  store ptr %9, ptr %3, align 8, !dbg !33
  br label %15, !dbg !33

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4, !dbg !34
  %12 = sub nsw i32 %11, 1, !dbg !35
  %13 = load ptr, ptr %5, align 8, !dbg !36
  %14 = call ptr @rec(i32 noundef %12, ptr noundef %13), !dbg !37
  store ptr %14, ptr %3, align 8, !dbg !38
  br label %15, !dbg !38

15:                                               ; preds = %10, %8
  %16 = load ptr, ptr %3, align 8, !dbg !39
  ret ptr %16, !dbg !39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !40 {
  %1 = alloca i32, align 4
  %2 = alloca [24 x i8], align 16
  %3 = alloca ptr, align 8
  %4 = alloca [24 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !43, !DIExpression(), !47)
  %5 = getelementptr inbounds [24 x i8], ptr %2, i64 0, i64 0, !dbg !48
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !49
    #dbg_declare(ptr %3, !50, !DIExpression(), !51)
  %7 = getelementptr inbounds [24 x i8], ptr %2, i64 0, i64 0, !dbg !52
  %8 = call ptr @rec(i32 noundef 4, ptr noundef %7), !dbg !53
  store ptr %8, ptr %3, align 8, !dbg !51
    #dbg_declare(ptr %4, !54, !DIExpression(), !55)
  %9 = getelementptr inbounds [24 x i8], ptr %4, i64 0, i64 0, !dbg !56
  %10 = load ptr, ptr %3, align 8, !dbg !57
  %11 = call ptr @strcpy(ptr noundef %9, ptr noundef %10) #3, !dbg !58
  ret i32 0, !dbg !59
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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Function Call Propagation/recursive_funcs.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "52974749c1821bafacd81efcfa9558c9")
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
!17 = distinct !DISubprogram(name: "rec", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !21, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{}
!23 = !DILocalVariable(name: "n", arg: 1, scope: !17, file: !2, line: 4, type: !21)
!24 = !DILocation(line: 4, column: 15, scope: !17)
!25 = !DILocalVariable(name: "p", arg: 2, scope: !17, file: !2, line: 4, type: !20)
!26 = !DILocation(line: 4, column: 24, scope: !17)
!27 = !DILocation(line: 5, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !17, file: !2, line: 5, column: 9)
!29 = !DILocation(line: 5, column: 11, scope: !28)
!30 = !DILocation(line: 5, column: 9, scope: !17)
!31 = !DILocation(line: 7, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !2, line: 6, column: 5)
!33 = !DILocation(line: 7, column: 9, scope: !32)
!34 = !DILocation(line: 9, column: 16, scope: !17)
!35 = !DILocation(line: 9, column: 18, scope: !17)
!36 = !DILocation(line: 9, column: 23, scope: !17)
!37 = !DILocation(line: 9, column: 12, scope: !17)
!38 = !DILocation(line: 9, column: 5, scope: !17)
!39 = !DILocation(line: 10, column: 1, scope: !17)
!40 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !41, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!41 = !DISubroutineType(types: !42)
!42 = !{!21}
!43 = !DILocalVariable(name: "buf", scope: !40, file: !2, line: 13, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 24)
!47 = !DILocation(line: 13, column: 10, scope: !40)
!48 = !DILocation(line: 14, column: 19, scope: !40)
!49 = !DILocation(line: 14, column: 5, scope: !40)
!50 = !DILocalVariable(name: "out", scope: !40, file: !2, line: 15, type: !20)
!51 = !DILocation(line: 15, column: 11, scope: !40)
!52 = !DILocation(line: 15, column: 24, scope: !40)
!53 = !DILocation(line: 15, column: 17, scope: !40)
!54 = !DILocalVariable(name: "copy", scope: !40, file: !2, line: 16, type: !44)
!55 = !DILocation(line: 16, column: 10, scope: !40)
!56 = !DILocation(line: 17, column: 12, scope: !40)
!57 = !DILocation(line: 17, column: 18, scope: !40)
!58 = !DILocation(line: 17, column: 5, scope: !40)
!59 = !DILocation(line: 18, column: 5, scope: !40)
