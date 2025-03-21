; ModuleID = 'testcases/vuln_simple.c'
source_filename = "testcases/vuln_simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"User could enter anything, right?\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [24 x i8] c"Now printing new_x: %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vuln() #0 !dbg !27 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !32, !DIExpression(), !33)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !34
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1), !dbg !35
  %4 = load i32, ptr %1, align 4, !dbg !36
  ret i32 %4, !dbg !37
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !38 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [8 x i8], align 1
  %5 = alloca [8 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca [8 x i8], align 1
  %8 = alloca [8 x i8], align 1
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !39, !DIExpression(), !40)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2), !dbg !41
    #dbg_declare(ptr %3, !42, !DIExpression(), !43)
  %10 = load i32, ptr %2, align 4, !dbg !44
  %11 = add nsw i32 %10, 26, !dbg !45
  store i32 %11, ptr %3, align 4, !dbg !43
  %12 = load i32, ptr %3, align 4, !dbg !46
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12), !dbg !47
    #dbg_declare(ptr %4, !48, !DIExpression(), !52)
    #dbg_declare(ptr %5, !53, !DIExpression(), !54)
  %14 = getelementptr inbounds [8 x i8], ptr %5, i64 0, i64 0, !dbg !55
  %15 = getelementptr inbounds [8 x i8], ptr %4, i64 0, i64 0, !dbg !55
  %16 = load i32, ptr %3, align 4, !dbg !56
  %17 = sext i32 %16 to i64, !dbg !56
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %14, ptr align 1 %15, i64 %17, i1 false), !dbg !55
    #dbg_declare(ptr %6, !57, !DIExpression(), !58)
  %18 = call i32 @vuln(), !dbg !59
  store i32 %18, ptr %6, align 4, !dbg !58
    #dbg_declare(ptr %7, !60, !DIExpression(), !61)
    #dbg_declare(ptr %8, !62, !DIExpression(), !63)
  %19 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0, !dbg !64
  %20 = getelementptr inbounds [8 x i8], ptr %7, i64 0, i64 0, !dbg !64
  %21 = load i32, ptr %6, align 4, !dbg !65
  %22 = sext i32 %21 to i64, !dbg !65
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %19, ptr align 1 %20, i64 %22, i1 false), !dbg !64
  ret i32 0, !dbg !66
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/vuln_simple.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "3bdbea226c6ecb02ba7b2801288bfec7")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 35)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 15, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 24)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !18, splitDebugInlining: false, nameTableKind: None)
!18 = !{!0, !7, !12}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 8, !"PIC Level", i32 2}
!23 = !{i32 7, !"PIE Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 2}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!27 = distinct !DISubprogram(name: "vuln", scope: !2, file: !2, line: 4, type: !28, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !31)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{}
!32 = !DILocalVariable(name: "x", scope: !27, file: !2, line: 5, type: !30)
!33 = !DILocation(line: 5, column: 9, scope: !27)
!34 = !DILocation(line: 6, column: 5, scope: !27)
!35 = !DILocation(line: 7, column: 5, scope: !27)
!36 = !DILocation(line: 8, column: 12, scope: !27)
!37 = !DILocation(line: 8, column: 5, scope: !27)
!38 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 11, type: !28, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !31)
!39 = !DILocalVariable(name: "x", scope: !38, file: !2, line: 12, type: !30)
!40 = !DILocation(line: 12, column: 9, scope: !38)
!41 = !DILocation(line: 13, column: 5, scope: !38)
!42 = !DILocalVariable(name: "new_x", scope: !38, file: !2, line: 14, type: !30)
!43 = !DILocation(line: 14, column: 9, scope: !38)
!44 = !DILocation(line: 14, column: 17, scope: !38)
!45 = !DILocation(line: 14, column: 19, scope: !38)
!46 = !DILocation(line: 15, column: 40, scope: !38)
!47 = !DILocation(line: 15, column: 5, scope: !38)
!48 = !DILocalVariable(name: "source", scope: !38, file: !2, line: 19, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 8)
!52 = !DILocation(line: 19, column: 10, scope: !38)
!53 = !DILocalVariable(name: "destination", scope: !38, file: !2, line: 20, type: !49)
!54 = !DILocation(line: 20, column: 10, scope: !38)
!55 = !DILocation(line: 21, column: 5, scope: !38)
!56 = !DILocation(line: 21, column: 33, scope: !38)
!57 = !DILocalVariable(name: "tainted_y", scope: !38, file: !2, line: 23, type: !30)
!58 = !DILocation(line: 23, column: 9, scope: !38)
!59 = !DILocation(line: 23, column: 21, scope: !38)
!60 = !DILocalVariable(name: "source2", scope: !38, file: !2, line: 24, type: !49)
!61 = !DILocation(line: 24, column: 10, scope: !38)
!62 = !DILocalVariable(name: "destination2", scope: !38, file: !2, line: 25, type: !49)
!63 = !DILocation(line: 25, column: 10, scope: !38)
!64 = !DILocation(line: 26, column: 5, scope: !38)
!65 = !DILocation(line: 26, column: 35, scope: !38)
!66 = !DILocation(line: 28, column: 5, scope: !38)
