; ModuleID = 'testcases/Structs, Unions and Nested Data Types/taint_struct_array.c'
source_filename = "testcases/Structs, Unions and Nested Data Types/taint_struct_array.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.AnotherStruct = type { [50 x i8], i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.AnotherStruct, align 4
  %3 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !30)
  %4 = getelementptr inbounds %struct.AnotherStruct, ptr %2, i32 0, i32 1, !dbg !31
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %4), !dbg !32
    #dbg_declare(ptr %3, !33, !DIExpression(), !34)
  %6 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0, !dbg !35
  %7 = getelementptr inbounds %struct.AnotherStruct, ptr %2, i32 0, i32 0, !dbg !36
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0, !dbg !35
  %9 = getelementptr inbounds %struct.AnotherStruct, ptr %2, i32 0, i32 1, !dbg !37
  %10 = load i32, ptr %9, align 4, !dbg !37
  %11 = sext i32 %10 to i64, !dbg !38
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 4 %8, i64 %11, i1 false), !dbg !35
  ret i32 0, !dbg !39
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Structs, Unions and Nested Data Types/taint_struct_array.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "079366ae4cde9cb18485bfae3e84c93f")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
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
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !18, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "another_struct_instance", scope: !17, file: !2, line: 10, type: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "AnotherStruct", file: !2, line: 4, size: 448, elements: !24)
!24 = !{!25, !29}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !23, file: !2, line: 5, baseType: !26, size: 400)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !23, file: !2, line: 6, baseType: !20, size: 32, offset: 416)
!30 = !DILocation(line: 10, column: 26, scope: !17)
!31 = !DILocation(line: 11, column: 42, scope: !17)
!32 = !DILocation(line: 11, column: 5, scope: !17)
!33 = !DILocalVariable(name: "out", scope: !17, file: !2, line: 13, type: !26)
!34 = !DILocation(line: 13, column: 10, scope: !17)
!35 = !DILocation(line: 14, column: 5, scope: !17)
!36 = !DILocation(line: 14, column: 41, scope: !17)
!37 = !DILocation(line: 14, column: 70, scope: !17)
!38 = !DILocation(line: 14, column: 46, scope: !17)
!39 = !DILocation(line: 16, column: 5, scope: !17)
