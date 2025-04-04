; ModuleID = 'testcases/struct_propagation.c'
source_filename = "testcases/struct_propagation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [32 x i8] c"Value of should_be_tainted: %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [50 x i8] c"Value of should_not_be_tainted_automatically: %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !34 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [20 x i8], align 16
  %4 = alloca [20 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !38, !DIExpression(), !39)
  %5 = call noalias ptr @malloc(i64 noundef 8) #4, !dbg !40
  store ptr %5, ptr %2, align 8, !dbg !39
  %6 = load ptr, ptr %2, align 8, !dbg !41
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 0, !dbg !42
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %7), !dbg !43
  %9 = load ptr, ptr %2, align 8, !dbg !44
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 1, !dbg !45
  store i32 10, ptr %10, align 4, !dbg !46
  %11 = load ptr, ptr %2, align 8, !dbg !47
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 0, !dbg !48
  %13 = load i32, ptr %12, align 4, !dbg !48
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %13), !dbg !49
  %15 = load ptr, ptr %2, align 8, !dbg !50
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1, !dbg !51
  %17 = load i32, ptr %16, align 4, !dbg !51
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %17), !dbg !52
    #dbg_declare(ptr %3, !53, !DIExpression(), !57)
    #dbg_declare(ptr %4, !58, !DIExpression(), !59)
  %19 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0, !dbg !60
  %20 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !61
  %21 = load ptr, ptr %2, align 8, !dbg !62
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0, !dbg !63
  %23 = load i32, ptr %22, align 4, !dbg !63
  %24 = sext i32 %23 to i64, !dbg !62
  %25 = call ptr @strncpy(ptr noundef %19, ptr noundef %20, i64 noundef %24) #5, !dbg !64
  %26 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0, !dbg !65
  %27 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !66
  %28 = load ptr, ptr %2, align 8, !dbg !67
  %29 = getelementptr inbounds %struct.node, ptr %28, i32 0, i32 1, !dbg !68
  %30 = load i32, ptr %29, align 4, !dbg !68
  %31 = sext i32 %30 to i64, !dbg !67
  %32 = call ptr @strncpy(ptr noundef %26, ptr noundef %27, i64 noundef %31) #5, !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/struct_propagation.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "2f564e57baba38aaa65317be1c2e8d1e")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 16, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 32)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 17, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 50)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !18, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !2, line: 8, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "should_be_tainted", scope: !20, file: !2, line: 9, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "should_not_be_tainted_automatically", scope: !20, file: !2, line: 10, baseType: !23, size: 32, offset: 32)
!25 = !{!0, !7, !12}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 8, !"PIC Level", i32 2}
!30 = !{i32 7, !"PIE Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 2}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!34 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !35, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !37)
!35 = !DISubroutineType(types: !36)
!36 = !{!23}
!37 = !{}
!38 = !DILocalVariable(name: "n", scope: !34, file: !2, line: 13, type: !19)
!39 = !DILocation(line: 13, column: 18, scope: !34)
!40 = !DILocation(line: 13, column: 37, scope: !34)
!41 = !DILocation(line: 14, column: 18, scope: !34)
!42 = !DILocation(line: 14, column: 21, scope: !34)
!43 = !DILocation(line: 14, column: 5, scope: !34)
!44 = !DILocation(line: 15, column: 5, scope: !34)
!45 = !DILocation(line: 15, column: 8, scope: !34)
!46 = !DILocation(line: 15, column: 44, scope: !34)
!47 = !DILocation(line: 16, column: 48, scope: !34)
!48 = !DILocation(line: 16, column: 51, scope: !34)
!49 = !DILocation(line: 16, column: 5, scope: !34)
!50 = !DILocation(line: 17, column: 66, scope: !34)
!51 = !DILocation(line: 17, column: 69, scope: !34)
!52 = !DILocation(line: 17, column: 5, scope: !34)
!53 = !DILocalVariable(name: "source", scope: !34, file: !2, line: 18, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 20)
!57 = !DILocation(line: 18, column: 10, scope: !34)
!58 = !DILocalVariable(name: "destination", scope: !34, file: !2, line: 19, type: !54)
!59 = !DILocation(line: 19, column: 10, scope: !34)
!60 = !DILocation(line: 20, column: 13, scope: !34)
!61 = !DILocation(line: 20, column: 26, scope: !34)
!62 = !DILocation(line: 20, column: 34, scope: !34)
!63 = !DILocation(line: 20, column: 37, scope: !34)
!64 = !DILocation(line: 20, column: 5, scope: !34)
!65 = !DILocation(line: 21, column: 13, scope: !34)
!66 = !DILocation(line: 21, column: 26, scope: !34)
!67 = !DILocation(line: 21, column: 34, scope: !34)
!68 = !DILocation(line: 21, column: 37, scope: !34)
!69 = !DILocation(line: 21, column: 5, scope: !34)
!70 = !DILocation(line: 22, column: 5, scope: !34)
