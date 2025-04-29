; ModuleID = 'testcases/Structs, Unions and Nested Data Types/inner_field.c'
source_filename = "testcases/Structs, Unions and Nested Data Types/inner_field.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Outer = type { %struct.Inner, [100 x i8] }
%struct.Inner = type { i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Outer, align 4
  %3 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !33)
  %4 = getelementptr inbounds %struct.Outer, ptr %2, i32 0, i32 0, !dbg !34
  %5 = getelementptr inbounds %struct.Inner, ptr %4, i32 0, i32 0, !dbg !35
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !36
    #dbg_declare(ptr %3, !37, !DIExpression(), !38)
  %7 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !39
  %8 = getelementptr inbounds %struct.Outer, ptr %2, i32 0, i32 1, !dbg !40
  %9 = getelementptr inbounds [100 x i8], ptr %8, i64 0, i64 0, !dbg !39
  %10 = getelementptr inbounds %struct.Outer, ptr %2, i32 0, i32 0, !dbg !41
  %11 = getelementptr inbounds %struct.Inner, ptr %10, i32 0, i32 0, !dbg !42
  %12 = load i32, ptr %11, align 4, !dbg !42
  %13 = sext i32 %12 to i64, !dbg !43
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 4 %9, i64 %13, i1 false), !dbg !39
  ret i32 0, !dbg !44
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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 15, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Structs, Unions and Nested Data Types/inner_field.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "26d347f1e477dbd13b008b991dba6723")
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
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !18, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "obj", scope: !17, file: !2, line: 14, type: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Outer", file: !2, line: 8, size: 832, elements: !24)
!24 = !{!25, !29}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "inner", scope: !23, file: !2, line: 9, baseType: !26, size: 32)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Inner", file: !2, line: 4, size: 32, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !26, file: !2, line: 5, baseType: !20, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !23, file: !2, line: 10, baseType: !30, size: 800, offset: 32)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 14, column: 18, scope: !17)
!34 = !DILocation(line: 15, column: 22, scope: !17)
!35 = !DILocation(line: 15, column: 28, scope: !17)
!36 = !DILocation(line: 15, column: 5, scope: !17)
!37 = !DILocalVariable(name: "dest", scope: !17, file: !2, line: 17, type: !30)
!38 = !DILocation(line: 17, column: 10, scope: !17)
!39 = !DILocation(line: 18, column: 5, scope: !17)
!40 = !DILocation(line: 18, column: 22, scope: !17)
!41 = !DILocation(line: 18, column: 34, scope: !17)
!42 = !DILocation(line: 18, column: 40, scope: !17)
!43 = !DILocation(line: 18, column: 30, scope: !17)
!44 = !DILocation(line: 20, column: 5, scope: !17)
