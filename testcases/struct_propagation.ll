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
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !38, !DIExpression(), !39)
  %3 = call noalias ptr @malloc(i64 noundef 8) #3, !dbg !40
  store ptr %3, ptr %2, align 8, !dbg !39
  %4 = load ptr, ptr %2, align 8, !dbg !41
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0, !dbg !42
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !43
  %7 = load ptr, ptr %2, align 8, !dbg !44
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1, !dbg !45
  store i32 10, ptr %8, align 4, !dbg !46
  %9 = load ptr, ptr %2, align 8, !dbg !47
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 0, !dbg !48
  %11 = load i32, ptr %10, align 4, !dbg !48
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %11), !dbg !49
  %13 = load ptr, ptr %2, align 8, !dbg !50
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 1, !dbg !51
  %15 = load i32, ptr %14, align 4, !dbg !51
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %15), !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/struct_propagation.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "2ad1cdb964b15e3e400677e0316ce332")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 32)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 50)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !18, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !2, line: 5, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "should_be_tainted", scope: !20, file: !2, line: 6, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "should_not_be_tainted_automatically", scope: !20, file: !2, line: 7, baseType: !23, size: 32, offset: 32)
!25 = !{!0, !7, !12}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 8, !"PIC Level", i32 2}
!30 = !{i32 7, !"PIE Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 2}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!34 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !35, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !37)
!35 = !DISubroutineType(types: !36)
!36 = !{!23}
!37 = !{}
!38 = !DILocalVariable(name: "n", scope: !34, file: !2, line: 10, type: !19)
!39 = !DILocation(line: 10, column: 18, scope: !34)
!40 = !DILocation(line: 10, column: 37, scope: !34)
!41 = !DILocation(line: 11, column: 18, scope: !34)
!42 = !DILocation(line: 11, column: 21, scope: !34)
!43 = !DILocation(line: 11, column: 5, scope: !34)
!44 = !DILocation(line: 12, column: 5, scope: !34)
!45 = !DILocation(line: 12, column: 8, scope: !34)
!46 = !DILocation(line: 12, column: 44, scope: !34)
!47 = !DILocation(line: 13, column: 48, scope: !34)
!48 = !DILocation(line: 13, column: 51, scope: !34)
!49 = !DILocation(line: 13, column: 5, scope: !34)
!50 = !DILocation(line: 14, column: 66, scope: !34)
!51 = !DILocation(line: 14, column: 69, scope: !34)
!52 = !DILocation(line: 14, column: 5, scope: !34)
!53 = !DILocation(line: 15, column: 5, scope: !34)
