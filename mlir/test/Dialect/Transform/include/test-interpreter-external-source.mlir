// RUN: mlir-opt %s
// No need to check anything else than parsing here, this is being used by another test as data.

transform.sequence failures(propagate) {
^bb0(%arg0: !transform.any_op):
  transform.debug.emit_remark_at %arg0, "outer" : !transform.any_op
  transform.sequence %arg0 : !transform.any_op failures(propagate) attributes {transform.target_tag="transform"} {
  ^bb1(%arg1: !transform.any_op):
    transform.debug.emit_remark_at %arg1, "inner" : !transform.any_op
  }
}
