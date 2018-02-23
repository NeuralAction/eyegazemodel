node {
  name: "input_image"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 60
        }
        dim {
          size: 60
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "input_image_r"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 60
        }
        dim {
          size: 60
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "input_image_f"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 60
        }
        dim {
          size: 60
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "input_label"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 2
        }
      }
    }
  }
}
node {
  name: "keep_prob"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "phase_train"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.19245009124279022
      }
    }
  }
}
node {
  name: "truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal/mul"
  op: "Mul"
  input: "truncated_normal/TruncatedNormal"
  input: "truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal"
  op: "Add"
  input: "truncated_normal/mul"
  input: "truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Assign"
  op: "Assign"
  input: "Variable_1"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/read"
  op: "Identity"
  input: "Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Conv2D"
  op: "Conv2D"
  input: "input_image"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "Conv2D"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual"
  op: "GreaterEqual"
  input: "add"
  input: "GreaterEqual/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu"
  op: "Elu"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "mul/x"
  input: "Elu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select"
  op: "Select"
  input: "GreaterEqual"
  input: "add"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_1"
  op: "Mul"
  input: "mul_1/x"
  input: "Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool"
  op: "MaxPool"
  input: "mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Conv2D_1"
  op: "Conv2D"
  input: "input_image_r"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_1"
  op: "Add"
  input: "Conv2D_1"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_1"
  op: "GreaterEqual"
  input: "add_1"
  input: "GreaterEqual_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_1"
  op: "Elu"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_2"
  op: "Mul"
  input: "mul_2/x"
  input: "Elu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_1"
  op: "Select"
  input: "GreaterEqual_1"
  input: "add_1"
  input: "mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_3/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_3"
  op: "Mul"
  input: "mul_3/x"
  input: "Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_1"
  op: "MaxPool"
  input: "mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\014\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1178511306643486
      }
    }
  }
}
node {
  name: "truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_1/mul"
  op: "Mul"
  input: "truncated_normal_1/TruncatedNormal"
  input: "truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_1"
  op: "Add"
  input: "truncated_normal_1/mul"
  input: "truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_2"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Assign"
  op: "Assign"
  input: "Variable_2"
  input: "truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/read"
  op: "Identity"
  input: "Variable_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Assign"
  op: "Assign"
  input: "Variable_3"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/read"
  op: "Identity"
  input: "Variable_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Conv2D_2"
  op: "Conv2D"
  input: "MaxPool"
  input: "Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_2"
  op: "Add"
  input: "Conv2D_2"
  input: "Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_2"
  op: "GreaterEqual"
  input: "add_2"
  input: "GreaterEqual_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_2"
  op: "Elu"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_4/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_4"
  op: "Mul"
  input: "mul_4/x"
  input: "Elu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_2"
  op: "Select"
  input: "GreaterEqual_2"
  input: "add_2"
  input: "mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_5/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_5"
  op: "Mul"
  input: "mul_5/x"
  input: "Select_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_2"
  op: "MaxPool"
  input: "mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Conv2D_3"
  op: "Conv2D"
  input: "MaxPool_1"
  input: "Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_3"
  op: "Add"
  input: "Conv2D_3"
  input: "Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_3"
  op: "GreaterEqual"
  input: "add_3"
  input: "GreaterEqual_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_3"
  op: "Elu"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_6/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_6"
  op: "Mul"
  input: "mul_6/x"
  input: "Elu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_3"
  op: "Select"
  input: "GreaterEqual_3"
  input: "add_3"
  input: "mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_7/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_7"
  op: "Mul"
  input: "mul_7/x"
  input: "Select_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_3"
  op: "MaxPool"
  input: "mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_2/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\014\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_2/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_2/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.09622504562139511
      }
    }
  }
}
node {
  name: "truncated_normal_2/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_2/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_2/mul"
  op: "Mul"
  input: "truncated_normal_2/TruncatedNormal"
  input: "truncated_normal_2/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_2"
  op: "Add"
  input: "truncated_normal_2/mul"
  input: "truncated_normal_2/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_4"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 12
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Assign"
  op: "Assign"
  input: "Variable_4"
  input: "truncated_normal_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/read"
  op: "Identity"
  input: "Variable_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Assign"
  op: "Assign"
  input: "Variable_5"
  input: "Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/read"
  op: "Identity"
  input: "Variable_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "Conv2D_4"
  op: "Conv2D"
  input: "MaxPool_2"
  input: "Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_4"
  op: "Add"
  input: "Conv2D_4"
  input: "Variable_5/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_4/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_4"
  op: "GreaterEqual"
  input: "add_4"
  input: "GreaterEqual_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_4"
  op: "Elu"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_8/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_8"
  op: "Mul"
  input: "mul_8/x"
  input: "Elu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_4"
  op: "Select"
  input: "GreaterEqual_4"
  input: "add_4"
  input: "mul_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_9/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_9"
  op: "Mul"
  input: "mul_9/x"
  input: "Select_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_4"
  op: "MaxPool"
  input: "mul_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Conv2D_5"
  op: "Conv2D"
  input: "MaxPool_3"
  input: "Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_5"
  op: "Add"
  input: "Conv2D_5"
  input: "Variable_5/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_5/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_5"
  op: "GreaterEqual"
  input: "add_5"
  input: "GreaterEqual_5/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_5"
  op: "Elu"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_10/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_10"
  op: "Mul"
  input: "mul_10/x"
  input: "Elu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_5"
  op: "Select"
  input: "GreaterEqual_5"
  input: "add_5"
  input: "mul_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_11/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_11"
  op: "Mul"
  input: "mul_11/x"
  input: "Select_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_5"
  op: "MaxPool"
  input: "mul_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_3/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_3/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_3/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.19245009124279022
      }
    }
  }
}
node {
  name: "truncated_normal_3/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_3/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_3/mul"
  op: "Mul"
  input: "truncated_normal_3/TruncatedNormal"
  input: "truncated_normal_3/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_3"
  op: "Add"
  input: "truncated_normal_3/mul"
  input: "truncated_normal_3/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_6"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Assign"
  op: "Assign"
  input: "Variable_6"
  input: "truncated_normal_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/read"
  op: "Identity"
  input: "Variable_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Assign"
  op: "Assign"
  input: "Variable_7"
  input: "Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/read"
  op: "Identity"
  input: "Variable_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "Conv2D_6"
  op: "Conv2D"
  input: "input_image_f"
  input: "Variable_6/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_6"
  op: "Add"
  input: "Conv2D_6"
  input: "Variable_7/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_6/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_6"
  op: "GreaterEqual"
  input: "add_6"
  input: "GreaterEqual_6/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_6"
  op: "Elu"
  input: "add_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_12/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_12"
  op: "Mul"
  input: "mul_12/x"
  input: "Elu_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_6"
  op: "Select"
  input: "GreaterEqual_6"
  input: "add_6"
  input: "mul_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_13/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_13"
  op: "Mul"
  input: "mul_13/x"
  input: "Select_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_6"
  op: "MaxPool"
  input: "mul_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_4/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_4/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_4/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1178511306643486
      }
    }
  }
}
node {
  name: "truncated_normal_4/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_4/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_4/mul"
  op: "Mul"
  input: "truncated_normal_4/TruncatedNormal"
  input: "truncated_normal_4/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_4"
  op: "Add"
  input: "truncated_normal_4/mul"
  input: "truncated_normal_4/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_8"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Assign"
  op: "Assign"
  input: "Variable_8"
  input: "truncated_normal_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/read"
  op: "Identity"
  input: "Variable_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Assign"
  op: "Assign"
  input: "Variable_9"
  input: "Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/read"
  op: "Identity"
  input: "Variable_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "Conv2D_7"
  op: "Conv2D"
  input: "MaxPool_6"
  input: "Variable_8/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_7"
  op: "Add"
  input: "Conv2D_7"
  input: "Variable_9/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_7/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_7"
  op: "GreaterEqual"
  input: "add_7"
  input: "GreaterEqual_7/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_7"
  op: "Elu"
  input: "add_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_14/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_14"
  op: "Mul"
  input: "mul_14/x"
  input: "Elu_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_7"
  op: "Select"
  input: "GreaterEqual_7"
  input: "add_7"
  input: "mul_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_15/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_15"
  op: "Mul"
  input: "mul_15/x"
  input: "Select_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_7"
  op: "MaxPool"
  input: "mul_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_5/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_5/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_5/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1178511306643486
      }
    }
  }
}
node {
  name: "truncated_normal_5/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_5/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_5/mul"
  op: "Mul"
  input: "truncated_normal_5/TruncatedNormal"
  input: "truncated_normal_5/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_5"
  op: "Add"
  input: "truncated_normal_5/mul"
  input: "truncated_normal_5/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_10"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Assign"
  op: "Assign"
  input: "Variable_10"
  input: "truncated_normal_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/read"
  op: "Identity"
  input: "Variable_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Const_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Assign"
  op: "Assign"
  input: "Variable_11"
  input: "Const_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/read"
  op: "Identity"
  input: "Variable_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "Conv2D_8"
  op: "Conv2D"
  input: "MaxPool_7"
  input: "Variable_10/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_8"
  op: "Add"
  input: "Conv2D_8"
  input: "Variable_11/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_8/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_8"
  op: "GreaterEqual"
  input: "add_8"
  input: "GreaterEqual_8/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_8"
  op: "Elu"
  input: "add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_16/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_16"
  op: "Mul"
  input: "mul_16/x"
  input: "Elu_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_8"
  op: "Select"
  input: "GreaterEqual_8"
  input: "add_8"
  input: "mul_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_17/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_17"
  op: "Mul"
  input: "mul_17/x"
  input: "Select_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_8"
  op: "MaxPool"
  input: "mul_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_6/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\020\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_6/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_6/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "truncated_normal_6/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_6/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_6/mul"
  op: "Mul"
  input: "truncated_normal_6/TruncatedNormal"
  input: "truncated_normal_6/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_6"
  op: "Add"
  input: "truncated_normal_6/mul"
  input: "truncated_normal_6/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_12"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 16
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Assign"
  op: "Assign"
  input: "Variable_12"
  input: "truncated_normal_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/read"
  op: "Identity"
  input: "Variable_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "Const_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Assign"
  op: "Assign"
  input: "Variable_13"
  input: "Const_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/read"
  op: "Identity"
  input: "Variable_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "Conv2D_9"
  op: "Conv2D"
  input: "MaxPool_8"
  input: "Variable_12/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_9"
  op: "Add"
  input: "Conv2D_9"
  input: "Variable_13/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_9/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_9"
  op: "GreaterEqual"
  input: "add_9"
  input: "GreaterEqual_9/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_9"
  op: "Elu"
  input: "add_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_18/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_18"
  op: "Mul"
  input: "mul_18/x"
  input: "Elu_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_9"
  op: "Select"
  input: "GreaterEqual_9"
  input: "add_9"
  input: "mul_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_19/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_19"
  op: "Mul"
  input: "mul_19/x"
  input: "Select_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_9"
  op: "MaxPool"
  input: "mul_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "truncated_normal_7/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000 \000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_7/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_7/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "truncated_normal_7/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_7/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_7/mul"
  op: "Mul"
  input: "truncated_normal_7/TruncatedNormal"
  input: "truncated_normal_7/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_7"
  op: "Add"
  input: "truncated_normal_7/mul"
  input: "truncated_normal_7/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_14"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_14/Assign"
  op: "Assign"
  input: "Variable_14"
  input: "truncated_normal_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_14/read"
  op: "Identity"
  input: "Variable_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
}
node {
  name: "Const_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_15"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_15/Assign"
  op: "Assign"
  input: "Variable_15"
  input: "Const_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_15/read"
  op: "Identity"
  input: "Variable_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
}
node {
  name: "Conv2D_10"
  op: "Conv2D"
  input: "MaxPool_9"
  input: "Variable_14/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_10"
  op: "Add"
  input: "Conv2D_10"
  input: "Variable_15/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_10/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_10"
  op: "GreaterEqual"
  input: "add_10"
  input: "GreaterEqual_10/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_10"
  op: "Elu"
  input: "add_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_20/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_20"
  op: "Mul"
  input: "mul_20/x"
  input: "Elu_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_10"
  op: "Select"
  input: "GreaterEqual_10"
  input: "add_10"
  input: "mul_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_21/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_21"
  op: "Mul"
  input: "mul_21/x"
  input: "Select_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_10"
  op: "MaxPool"
  input: "mul_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\000\002\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "MaxPool_10"
  input: "Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout/cond/switch_t"
  op: "Identity"
  input: "dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout/cond/switch_f"
  op: "Identity"
  input: "dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout/cond/sub/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub/Switch"
  op: "Switch"
  input: "keep_prob"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@keep_prob"
      }
    }
  }
}
node {
  name: "dropout/cond/sub"
  op: "Sub"
  input: "dropout/cond/sub/x"
  input: "dropout/cond/sub/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/alpha"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7580993175506592
      }
    }
  }
}
node {
  name: "dropout/cond/Shape/Switch"
  op: "Switch"
  input: "Reshape"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Reshape"
      }
    }
  }
}
node {
  name: "dropout/cond/Shape"
  op: "Shape"
  input: "dropout/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout/cond/random_uniform/min"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout/cond/random_uniform/max"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout/cond/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dropout/cond/random_uniform/sub"
  op: "Sub"
  input: "dropout/cond/random_uniform/max"
  input: "dropout/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/random_uniform/mul"
  op: "Mul"
  input: "dropout/cond/random_uniform/RandomUniform"
  input: "dropout/cond/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/random_uniform"
  op: "Add"
  input: "dropout/cond/random_uniform/mul"
  input: "dropout/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/add"
  op: "Add"
  input: "dropout/cond/sub"
  input: "dropout/cond/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/Floor"
  op: "Floor"
  input: "dropout/cond/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul"
  op: "Mul"
  input: "dropout/cond/Shape/Switch:1"
  input: "dropout/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/sub_1/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub_1"
  op: "Sub"
  input: "dropout/cond/sub_1/x"
  input: "dropout/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_1"
  op: "Mul"
  input: "dropout/cond/alpha"
  input: "dropout/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/add_1"
  op: "Add"
  input: "dropout/cond/mul"
  input: "dropout/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/sub_2/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub_2"
  op: "Sub"
  input: "dropout/cond/sub_2/x"
  input: "dropout/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/sub_3/y"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub_3"
  op: "Sub"
  input: "dropout/cond/alpha"
  input: "dropout/cond/sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/Pow/y"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "dropout/cond/Pow"
  op: "Pow"
  input: "dropout/cond/sub_3"
  input: "dropout/cond/Pow/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_2"
  op: "Mul"
  input: "dropout/cond/sub_2"
  input: "dropout/cond/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/add_2/y"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/add_2"
  op: "Add"
  input: "dropout/cond/mul_2"
  input: "dropout/cond/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_3"
  op: "Mul"
  input: "dropout/cond/sub"
  input: "dropout/cond/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/truediv/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/truediv"
  op: "RealDiv"
  input: "dropout/cond/truediv/x"
  input: "dropout/cond/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/Sqrt"
  op: "Sqrt"
  input: "dropout/cond/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_4/y"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout/cond/mul_4"
  op: "Mul"
  input: "dropout/cond/sub"
  input: "dropout/cond/mul_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/sub_4/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub_4"
  op: "Sub"
  input: "dropout/cond/sub_4/x"
  input: "dropout/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_5"
  op: "Mul"
  input: "dropout/cond/sub_4"
  input: "dropout/cond/alpha"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/add_3"
  op: "Add"
  input: "dropout/cond/mul_4"
  input: "dropout/cond/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_6"
  op: "Mul"
  input: "dropout/cond/Sqrt"
  input: "dropout/cond/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/sub_5/x"
  op: "Const"
  input: "^dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout/cond/sub_5"
  op: "Sub"
  input: "dropout/cond/sub_5/x"
  input: "dropout/cond/mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/mul_7"
  op: "Mul"
  input: "dropout/cond/Sqrt"
  input: "dropout/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/add_4"
  op: "Add"
  input: "dropout/cond/mul_7"
  input: "dropout/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/Identity/Switch"
  op: "Switch"
  input: "Reshape"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Reshape"
      }
    }
  }
}
node {
  name: "dropout/cond/Identity"
  op: "Identity"
  input: "dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/cond/Merge"
  op: "Merge"
  input: "dropout/cond/Identity"
  input: "dropout/cond/add_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_8/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\002\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_8/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_8/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04419417306780815
      }
    }
  }
}
node {
  name: "truncated_normal_8/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_8/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_8/mul"
  op: "Mul"
  input: "truncated_normal_8/TruncatedNormal"
  input: "truncated_normal_8/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_8"
  op: "Add"
  input: "truncated_normal_8/mul"
  input: "truncated_normal_8/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_16"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_16/Assign"
  op: "Assign"
  input: "Variable_16"
  input: "truncated_normal_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_16/read"
  op: "Identity"
  input: "Variable_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
}
node {
  name: "L2Loss"
  op: "L2Loss"
  input: "Variable_16/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Mul"
  op: "Mul"
  input: "L2Loss"
  input: "Mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Sum"
  op: "Sum"
  input: "Mul"
  input: "Const_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_17"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_17/Assign"
  op: "Assign"
  input: "Variable_17"
  input: "Const_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_17/read"
  op: "Identity"
  input: "Variable_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "dropout/cond/Merge"
  input: "Variable_16/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Add"
  op: "Add"
  input: "MatMul"
  input: "Variable_17/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_11/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_11"
  op: "GreaterEqual"
  input: "Add"
  input: "GreaterEqual_11/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_11"
  op: "Elu"
  input: "Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_22/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_22"
  op: "Mul"
  input: "mul_22/x"
  input: "Elu_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_11"
  op: "Select"
  input: "GreaterEqual_11"
  input: "Add"
  input: "mul_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_23/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_23"
  op: "Mul"
  input: "mul_23/x"
  input: "Select_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/switch_t"
  op: "Identity"
  input: "dropout_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/switch_f"
  op: "Identity"
  input: "dropout_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/sub/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub/Switch"
  op: "Switch"
  input: "keep_prob"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@keep_prob"
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub"
  op: "Sub"
  input: "dropout_1/cond/sub/x"
  input: "dropout_1/cond/sub/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/alpha"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7580993175506592
      }
    }
  }
}
node {
  name: "dropout_1/cond/Shape/Switch"
  op: "Switch"
  input: "mul_23"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@mul_23"
      }
    }
  }
}
node {
  name: "dropout_1/cond/Shape"
  op: "Shape"
  input: "dropout_1/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform/min"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform/max"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_1/cond/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform/sub"
  op: "Sub"
  input: "dropout_1/cond/random_uniform/max"
  input: "dropout_1/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform/mul"
  op: "Mul"
  input: "dropout_1/cond/random_uniform/RandomUniform"
  input: "dropout_1/cond/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/random_uniform"
  op: "Add"
  input: "dropout_1/cond/random_uniform/mul"
  input: "dropout_1/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/add"
  op: "Add"
  input: "dropout_1/cond/sub"
  input: "dropout_1/cond/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Floor"
  op: "Floor"
  input: "dropout_1/cond/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul"
  op: "Mul"
  input: "dropout_1/cond/Shape/Switch:1"
  input: "dropout_1/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/sub_1/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub_1"
  op: "Sub"
  input: "dropout_1/cond/sub_1/x"
  input: "dropout_1/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_1"
  op: "Mul"
  input: "dropout_1/cond/alpha"
  input: "dropout_1/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/add_1"
  op: "Add"
  input: "dropout_1/cond/mul"
  input: "dropout_1/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/sub_2/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub_2"
  op: "Sub"
  input: "dropout_1/cond/sub_2/x"
  input: "dropout_1/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/sub_3/y"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub_3"
  op: "Sub"
  input: "dropout_1/cond/alpha"
  input: "dropout_1/cond/sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Pow/y"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/Pow"
  op: "Pow"
  input: "dropout_1/cond/sub_3"
  input: "dropout_1/cond/Pow/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_2"
  op: "Mul"
  input: "dropout_1/cond/sub_2"
  input: "dropout_1/cond/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/add_2/y"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/add_2"
  op: "Add"
  input: "dropout_1/cond/mul_2"
  input: "dropout_1/cond/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_3"
  op: "Mul"
  input: "dropout_1/cond/sub"
  input: "dropout_1/cond/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/truediv/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/truediv"
  op: "RealDiv"
  input: "dropout_1/cond/truediv/x"
  input: "dropout_1/cond/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Sqrt"
  op: "Sqrt"
  input: "dropout_1/cond/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_4/y"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/mul_4"
  op: "Mul"
  input: "dropout_1/cond/sub"
  input: "dropout_1/cond/mul_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/sub_4/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub_4"
  op: "Sub"
  input: "dropout_1/cond/sub_4/x"
  input: "dropout_1/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_5"
  op: "Mul"
  input: "dropout_1/cond/sub_4"
  input: "dropout_1/cond/alpha"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/add_3"
  op: "Add"
  input: "dropout_1/cond/mul_4"
  input: "dropout_1/cond/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_6"
  op: "Mul"
  input: "dropout_1/cond/Sqrt"
  input: "dropout_1/cond/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/sub_5/x"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/sub_5"
  op: "Sub"
  input: "dropout_1/cond/sub_5/x"
  input: "dropout_1/cond/mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul_7"
  op: "Mul"
  input: "dropout_1/cond/Sqrt"
  input: "dropout_1/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/add_4"
  op: "Add"
  input: "dropout_1/cond/mul_7"
  input: "dropout_1/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Identity/Switch"
  op: "Switch"
  input: "mul_23"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@mul_23"
      }
    }
  }
}
node {
  name: "dropout_1/cond/Identity"
  op: "Identity"
  input: "dropout_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Merge"
  op: "Merge"
  input: "dropout_1/cond/Identity"
  input: "dropout_1/cond/add_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "concat"
  op: "ConcatV2"
  input: "MaxPool_4"
  input: "MaxPool_5"
  input: "concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "truncated_normal_9/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000 \000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_9/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_9/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "truncated_normal_9/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_9/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_9/mul"
  op: "Mul"
  input: "truncated_normal_9/TruncatedNormal"
  input: "truncated_normal_9/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_9"
  op: "Add"
  input: "truncated_normal_9/mul"
  input: "truncated_normal_9/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_18"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_18/Assign"
  op: "Assign"
  input: "Variable_18"
  input: "truncated_normal_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_18/read"
  op: "Identity"
  input: "Variable_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
}
node {
  name: "Const_10"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_19"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_19/Assign"
  op: "Assign"
  input: "Variable_19"
  input: "Const_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_19/read"
  op: "Identity"
  input: "Variable_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
}
node {
  name: "Conv2D_11"
  op: "Conv2D"
  input: "concat"
  input: "Variable_18/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "add_11"
  op: "Add"
  input: "Conv2D_11"
  input: "Variable_19/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_12/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_12"
  op: "GreaterEqual"
  input: "add_11"
  input: "GreaterEqual_12/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_12"
  op: "Elu"
  input: "add_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_24/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_24"
  op: "Mul"
  input: "mul_24/x"
  input: "Elu_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_12"
  op: "Select"
  input: "GreaterEqual_12"
  input: "add_11"
  input: "mul_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_25/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_25"
  op: "Mul"
  input: "mul_25/x"
  input: "Select_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_11"
  op: "MaxPool"
  input: "mul_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\000\002\000\000"
      }
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "MaxPool_11"
  input: "Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_2/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/switch_t"
  op: "Identity"
  input: "dropout_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/switch_f"
  op: "Identity"
  input: "dropout_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/sub/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub/Switch"
  op: "Switch"
  input: "keep_prob"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@keep_prob"
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub"
  op: "Sub"
  input: "dropout_2/cond/sub/x"
  input: "dropout_2/cond/sub/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/alpha"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7580993175506592
      }
    }
  }
}
node {
  name: "dropout_2/cond/Shape/Switch"
  op: "Switch"
  input: "Reshape_1"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Reshape_1"
      }
    }
  }
}
node {
  name: "dropout_2/cond/Shape"
  op: "Shape"
  input: "dropout_2/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform/min"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform/max"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_2/cond/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform/sub"
  op: "Sub"
  input: "dropout_2/cond/random_uniform/max"
  input: "dropout_2/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform/mul"
  op: "Mul"
  input: "dropout_2/cond/random_uniform/RandomUniform"
  input: "dropout_2/cond/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/random_uniform"
  op: "Add"
  input: "dropout_2/cond/random_uniform/mul"
  input: "dropout_2/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/add"
  op: "Add"
  input: "dropout_2/cond/sub"
  input: "dropout_2/cond/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Floor"
  op: "Floor"
  input: "dropout_2/cond/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul"
  op: "Mul"
  input: "dropout_2/cond/Shape/Switch:1"
  input: "dropout_2/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/sub_1/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub_1"
  op: "Sub"
  input: "dropout_2/cond/sub_1/x"
  input: "dropout_2/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_1"
  op: "Mul"
  input: "dropout_2/cond/alpha"
  input: "dropout_2/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/add_1"
  op: "Add"
  input: "dropout_2/cond/mul"
  input: "dropout_2/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/sub_2/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub_2"
  op: "Sub"
  input: "dropout_2/cond/sub_2/x"
  input: "dropout_2/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/sub_3/y"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub_3"
  op: "Sub"
  input: "dropout_2/cond/alpha"
  input: "dropout_2/cond/sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Pow/y"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/Pow"
  op: "Pow"
  input: "dropout_2/cond/sub_3"
  input: "dropout_2/cond/Pow/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_2"
  op: "Mul"
  input: "dropout_2/cond/sub_2"
  input: "dropout_2/cond/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/add_2/y"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/add_2"
  op: "Add"
  input: "dropout_2/cond/mul_2"
  input: "dropout_2/cond/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_3"
  op: "Mul"
  input: "dropout_2/cond/sub"
  input: "dropout_2/cond/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/truediv/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/truediv"
  op: "RealDiv"
  input: "dropout_2/cond/truediv/x"
  input: "dropout_2/cond/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Sqrt"
  op: "Sqrt"
  input: "dropout_2/cond/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_4/y"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/mul_4"
  op: "Mul"
  input: "dropout_2/cond/sub"
  input: "dropout_2/cond/mul_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/sub_4/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub_4"
  op: "Sub"
  input: "dropout_2/cond/sub_4/x"
  input: "dropout_2/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_5"
  op: "Mul"
  input: "dropout_2/cond/sub_4"
  input: "dropout_2/cond/alpha"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/add_3"
  op: "Add"
  input: "dropout_2/cond/mul_4"
  input: "dropout_2/cond/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_6"
  op: "Mul"
  input: "dropout_2/cond/Sqrt"
  input: "dropout_2/cond/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/sub_5/x"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/sub_5"
  op: "Sub"
  input: "dropout_2/cond/sub_5/x"
  input: "dropout_2/cond/mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul_7"
  op: "Mul"
  input: "dropout_2/cond/Sqrt"
  input: "dropout_2/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/add_4"
  op: "Add"
  input: "dropout_2/cond/mul_7"
  input: "dropout_2/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Identity/Switch"
  op: "Switch"
  input: "Reshape_1"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Reshape_1"
      }
    }
  }
}
node {
  name: "dropout_2/cond/Identity"
  op: "Identity"
  input: "dropout_2/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Merge"
  op: "Merge"
  input: "dropout_2/cond/Identity"
  input: "dropout_2/cond/add_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_10/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\002\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_10/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_10/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04419417306780815
      }
    }
  }
}
node {
  name: "truncated_normal_10/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_10/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_10/mul"
  op: "Mul"
  input: "truncated_normal_10/TruncatedNormal"
  input: "truncated_normal_10/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_10"
  op: "Add"
  input: "truncated_normal_10/mul"
  input: "truncated_normal_10/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_20"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_20/Assign"
  op: "Assign"
  input: "Variable_20"
  input: "truncated_normal_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_20/read"
  op: "Identity"
  input: "Variable_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
}
node {
  name: "L2Loss_1"
  op: "L2Loss"
  input: "Variable_20/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Mul_1"
  op: "Mul"
  input: "L2Loss_1"
  input: "Mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_11"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Sum_1"
  op: "Sum"
  input: "Mul_1"
  input: "Const_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_12"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_21"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_21/Assign"
  op: "Assign"
  input: "Variable_21"
  input: "Const_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_21/read"
  op: "Identity"
  input: "Variable_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
}
node {
  name: "MatMul_1"
  op: "MatMul"
  input: "dropout_2/cond/Merge"
  input: "Variable_20/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Add_1"
  op: "Add"
  input: "MatMul_1"
  input: "Variable_21/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "GreaterEqual_13/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "GreaterEqual_13"
  op: "GreaterEqual"
  input: "Add_1"
  input: "GreaterEqual_13/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Elu_13"
  op: "Elu"
  input: "Add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_26/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.6732631921768188
      }
    }
  }
}
node {
  name: "mul_26"
  op: "Mul"
  input: "mul_26/x"
  input: "Elu_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Select_13"
  op: "Select"
  input: "GreaterEqual_13"
  input: "Add_1"
  input: "mul_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_27/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0507010221481323
      }
    }
  }
}
node {
  name: "mul_27"
  op: "Mul"
  input: "mul_27/x"
  input: "Select_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Switch"
  op: "Switch"
  input: "phase_train"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_3/cond/switch_t"
  op: "Identity"
  input: "dropout_3/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_3/cond/switch_f"
  op: "Identity"
  input: "dropout_3/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_3/cond/pred_id"
  op: "Identity"
  input: "phase_train"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_3/cond/sub/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub/Switch"
  op: "Switch"
  input: "keep_prob"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@keep_prob"
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub"
  op: "Sub"
  input: "dropout_3/cond/sub/x"
  input: "dropout_3/cond/sub/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/alpha"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.7580993175506592
      }
    }
  }
}
node {
  name: "dropout_3/cond/Shape/Switch"
  op: "Switch"
  input: "mul_27"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@mul_27"
      }
    }
  }
}
node {
  name: "dropout_3/cond/Shape"
  op: "Shape"
  input: "dropout_3/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform/min"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform/max"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_3/cond/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform/sub"
  op: "Sub"
  input: "dropout_3/cond/random_uniform/max"
  input: "dropout_3/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform/mul"
  op: "Mul"
  input: "dropout_3/cond/random_uniform/RandomUniform"
  input: "dropout_3/cond/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/random_uniform"
  op: "Add"
  input: "dropout_3/cond/random_uniform/mul"
  input: "dropout_3/cond/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/add"
  op: "Add"
  input: "dropout_3/cond/sub"
  input: "dropout_3/cond/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Floor"
  op: "Floor"
  input: "dropout_3/cond/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul"
  op: "Mul"
  input: "dropout_3/cond/Shape/Switch:1"
  input: "dropout_3/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/sub_1/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub_1"
  op: "Sub"
  input: "dropout_3/cond/sub_1/x"
  input: "dropout_3/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_1"
  op: "Mul"
  input: "dropout_3/cond/alpha"
  input: "dropout_3/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/add_1"
  op: "Add"
  input: "dropout_3/cond/mul"
  input: "dropout_3/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/sub_2/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub_2"
  op: "Sub"
  input: "dropout_3/cond/sub_2/x"
  input: "dropout_3/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/sub_3/y"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub_3"
  op: "Sub"
  input: "dropout_3/cond/alpha"
  input: "dropout_3/cond/sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Pow/y"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/Pow"
  op: "Pow"
  input: "dropout_3/cond/sub_3"
  input: "dropout_3/cond/Pow/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_2"
  op: "Mul"
  input: "dropout_3/cond/sub_2"
  input: "dropout_3/cond/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/add_2/y"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/add_2"
  op: "Add"
  input: "dropout_3/cond/mul_2"
  input: "dropout_3/cond/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_3"
  op: "Mul"
  input: "dropout_3/cond/sub"
  input: "dropout_3/cond/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/truediv/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/truediv"
  op: "RealDiv"
  input: "dropout_3/cond/truediv/x"
  input: "dropout_3/cond/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Sqrt"
  op: "Sqrt"
  input: "dropout_3/cond/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_4/y"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/mul_4"
  op: "Mul"
  input: "dropout_3/cond/sub"
  input: "dropout_3/cond/mul_4/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/sub_4/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub_4"
  op: "Sub"
  input: "dropout_3/cond/sub_4/x"
  input: "dropout_3/cond/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_5"
  op: "Mul"
  input: "dropout_3/cond/sub_4"
  input: "dropout_3/cond/alpha"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/add_3"
  op: "Add"
  input: "dropout_3/cond/mul_4"
  input: "dropout_3/cond/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_6"
  op: "Mul"
  input: "dropout_3/cond/Sqrt"
  input: "dropout_3/cond/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/sub_5/x"
  op: "Const"
  input: "^dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_3/cond/sub_5"
  op: "Sub"
  input: "dropout_3/cond/sub_5/x"
  input: "dropout_3/cond/mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/mul_7"
  op: "Mul"
  input: "dropout_3/cond/Sqrt"
  input: "dropout_3/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/add_4"
  op: "Add"
  input: "dropout_3/cond/mul_7"
  input: "dropout_3/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Identity/Switch"
  op: "Switch"
  input: "mul_27"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@mul_27"
      }
    }
  }
}
node {
  name: "dropout_3/cond/Identity"
  op: "Identity"
  input: "dropout_3/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/cond/Merge"
  op: "Merge"
  input: "dropout_3/cond/Identity"
  input: "dropout_3/cond/add_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "concat_1"
  op: "ConcatV2"
  input: "dropout_3/cond/Merge"
  input: "dropout_1/cond/Merge"
  input: "concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "truncated_normal_11/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_11/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_11/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "truncated_normal_11/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_11/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_11/mul"
  op: "Mul"
  input: "truncated_normal_11/TruncatedNormal"
  input: "truncated_normal_11/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_11"
  op: "Add"
  input: "truncated_normal_11/mul"
  input: "truncated_normal_11/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_22"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_22/Assign"
  op: "Assign"
  input: "Variable_22"
  input: "truncated_normal_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_22/read"
  op: "Identity"
  input: "Variable_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
}
node {
  name: "L2Loss_2"
  op: "L2Loss"
  input: "Variable_22/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Mul_2"
  op: "Mul"
  input: "L2Loss_2"
  input: "Mul_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_13"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Sum_2"
  op: "Sum"
  input: "Mul_2"
  input: "Const_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_14"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_23"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_23/Assign"
  op: "Assign"
  input: "Variable_23"
  input: "Const_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_23/read"
  op: "Identity"
  input: "Variable_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
}
node {
  name: "MatMul_2"
  op: "MatMul"
  input: "concat_1"
  input: "Variable_22/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Add_2"
  op: "Add"
  input: "MatMul_2"
  input: "Variable_23/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub"
  op: "Sub"
  input: "input_label"
  input: "Add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Square"
  op: "Square"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_15"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Mean"
  op: "Mean"
  input: "Square"
  input: "Const_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "sub_1"
  op: "Sub"
  input: "Add_2"
  input: "input_label"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Square_1"
  op: "Square"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sum_3/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sum_3"
  op: "Sum"
  input: "Square_1"
  input: "Sum_3/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Sqrt"
  op: "Sqrt"
  input: "Sum_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_16"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Max"
  op: "Max"
  input: "Sqrt"
  input: "Const_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_17"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Min"
  op: "Min"
  input: "Sqrt"
  input: "Const_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Const_18"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean_1"
  op: "Mean"
  input: "Sqrt"
  input: "Const_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "truediv/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "truediv"
  op: "RealDiv"
  input: "Mean_1"
  input: "truediv/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_28/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 100.0
      }
    }
  }
}
node {
  name: "mul_28"
  op: "Mul"
  input: "truediv"
  input: "mul_28/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 100.0
      }
    }
  }
}
node {
  name: "sub_2"
  op: "Sub"
  input: "sub_2/x"
  input: "mul_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable_24/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Variable_24"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_24/Assign"
  op: "Assign"
  input: "Variable_24"
  input: "Variable_24/initial_value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_24"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_24/read"
  op: "Identity"
  input: "Variable_24"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_24"
      }
    }
  }
}
node {
  name: "ExponentialDecay/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-05
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast"
  op: "Cast"
  input: "Variable_24/read"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 8397
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1"
  op: "Cast"
  input: "ExponentialDecay/Cast_1/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ExponentialDecay/Cast_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.800000011920929
      }
    }
  }
}
node {
  name: "ExponentialDecay/truediv"
  op: "RealDiv"
  input: "ExponentialDecay/Cast"
  input: "ExponentialDecay/Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Floor"
  op: "Floor"
  input: "ExponentialDecay/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Pow"
  op: "Pow"
  input: "ExponentialDecay/Cast_2/x"
  input: "ExponentialDecay/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay"
  op: "Mul"
  input: "ExponentialDecay/learning_rate"
  input: "ExponentialDecay/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Square_grad/mul/x"
  op: "Const"
  input: "^gradients/Mean_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/Square_grad/mul"
  op: "Mul"
  input: "gradients/Square_grad/mul/x"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Square_grad/mul_1"
  op: "Mul"
  input: "gradients/Mean_grad/truediv"
  input: "gradients/Square_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/sub_grad/Shape"
  op: "Shape"
  input: "input_label"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Shape_1"
  op: "Shape"
  input: "Add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/sub_grad/Shape"
  input: "gradients/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Sum"
  op: "Sum"
  input: "gradients/Square_grad/mul_1"
  input: "gradients/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/sub_grad/Sum"
  input: "gradients/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/Square_grad/mul_1"
  input: "gradients/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_grad/Neg"
  op: "Neg"
  input: "gradients/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/sub_grad/Neg"
  input: "gradients/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/sub_grad/Reshape"
  input: "^gradients/sub_grad/Reshape_1"
}
node {
  name: "gradients/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/sub_grad/Reshape"
  input: "^gradients/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/sub_grad/Reshape_1"
  input: "^gradients/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/Shape"
  op: "Shape"
  input: "MatMul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_2_grad/Shape"
  input: "gradients/Add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_2_grad/Sum"
  op: "Sum"
  input: "gradients/sub_grad/tuple/control_dependency_1"
  input: "gradients/Add_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_2_grad/Sum"
  input: "gradients/Add_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/sub_grad/tuple/control_dependency_1"
  input: "gradients/Add_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_2_grad/Sum_1"
  input: "gradients/Add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_2_grad/Reshape"
  input: "^gradients/Add_2_grad/Reshape_1"
}
node {
  name: "gradients/Add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_2_grad/Reshape"
  input: "^gradients/Add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_2_grad/Reshape_1"
  input: "^gradients/Add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_2_grad/tuple/control_dependency"
  input: "Variable_22/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/MatMul_1"
  op: "MatMul"
  input: "concat_1"
  input: "gradients/Add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_2_grad/MatMul"
  input: "^gradients/MatMul_2_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_2_grad/MatMul"
  input: "^gradients/MatMul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_2_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_2_grad/MatMul_1"
  input: "^gradients/MatMul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_2_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/mod"
  op: "FloorMod"
  input: "concat_1/axis"
  input: "gradients/concat_1_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/Shape"
  op: "Shape"
  input: "dropout_3/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/ShapeN"
  op: "ShapeN"
  input: "dropout_3/cond/Merge"
  input: "dropout_1/cond/Merge"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_1_grad/mod"
  input: "gradients/concat_1_grad/ShapeN"
  input: "gradients/concat_1_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_1_grad/Slice"
  op: "Slice"
  input: "gradients/MatMul_2_grad/tuple/control_dependency"
  input: "gradients/concat_1_grad/ConcatOffset"
  input: "gradients/concat_1_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_1_grad/Slice_1"
  op: "Slice"
  input: "gradients/MatMul_2_grad/tuple/control_dependency"
  input: "gradients/concat_1_grad/ConcatOffset:1"
  input: "gradients/concat_1_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_1_grad/Slice"
  input: "^gradients/concat_1_grad/Slice_1"
}
node {
  name: "gradients/concat_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_1_grad/Slice"
  input: "^gradients/concat_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_1_grad/Slice_1"
  input: "^gradients/concat_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/concat_1_grad/tuple/control_dependency"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/dropout_3/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/Merge_grad/cond_grad"
  input: "^gradients/dropout_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/Merge_grad/cond_grad:1"
  input: "^gradients/dropout_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/concat_1_grad/tuple/control_dependency_1"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/dropout_1/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/Merge_grad/cond_grad"
  input: "^gradients/dropout_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/Merge_grad/cond_grad:1"
  input: "^gradients/dropout_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Shape"
  op: "Shape"
  input: "dropout_3/cond/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/add_4_grad/Shape"
  input: "gradients/dropout_3/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/add_4_grad/Sum"
  input: "gradients/dropout_3/cond/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/add_4_grad/Sum_1"
  input: "gradients/dropout_3/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_3/cond/add_4_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_3/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/add_4_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/add_4_grad/Shape"
  input: "gradients/dropout_1/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/add_4_grad/Sum"
  input: "gradients/dropout_1/cond/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/add_4_grad/Sum_1"
  input: "gradients/dropout_1/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_1/cond/add_4_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_1/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/add_4_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch"
  op: "Switch"
  input: "mul_27"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_1"
  op: "Shape"
  input: "gradients/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros"
  op: "Fill"
  input: "gradients/Shape_1"
  input: "gradients/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_3/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Shape"
  op: "Shape"
  input: "dropout_3/cond/Sqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/mul_7_grad/Shape"
  input: "gradients/dropout_3/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/mul"
  op: "Mul"
  input: "gradients/dropout_3/cond/add_4_grad/tuple/control_dependency"
  input: "dropout_3/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_7_grad/mul"
  input: "gradients/dropout_3/cond/mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_7_grad/Sum"
  input: "gradients/dropout_3/cond/mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/mul_1"
  op: "Mul"
  input: "dropout_3/cond/Sqrt"
  input: "gradients/dropout_3/cond/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_7_grad/mul_1"
  input: "gradients/dropout_3/cond/mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_7_grad/Sum_1"
  input: "gradients/dropout_3/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_7_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_7_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_1"
  op: "Switch"
  input: "mul_23"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_2"
  op: "Shape"
  input: "gradients/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_1"
  op: "Fill"
  input: "gradients/Shape_2"
  input: "gradients/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_1/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/Sqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/mul_7_grad/Shape"
  input: "gradients/dropout_1/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/mul"
  op: "Mul"
  input: "gradients/dropout_1/cond/add_4_grad/tuple/control_dependency"
  input: "dropout_1/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_7_grad/mul"
  input: "gradients/dropout_1/cond/mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_7_grad/Sum"
  input: "gradients/dropout_1/cond/mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/mul_1"
  op: "Mul"
  input: "dropout_1/cond/Sqrt"
  input: "gradients/dropout_1/cond/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_7_grad/mul_1"
  input: "gradients/dropout_1/cond/mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_7_grad/Sum_1"
  input: "gradients/dropout_1/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_7_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_7_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Shape"
  op: "Shape"
  input: "dropout_3/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/add_1_grad/Shape"
  input: "gradients/dropout_3/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/add_1_grad/Sum"
  input: "gradients/dropout_3/cond/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/add_1_grad/Sum_1"
  input: "gradients/dropout_3/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/add_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/add_1_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/add_1_grad/Shape"
  input: "gradients/dropout_1/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/add_1_grad/Sum"
  input: "gradients/dropout_1/cond/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/add_1_grad/Sum_1"
  input: "gradients/dropout_1/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/add_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/add_1_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout_3/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/mul_grad/Shape"
  input: "gradients/dropout_3/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/mul"
  op: "Mul"
  input: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency"
  input: "dropout_3/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_grad/mul"
  input: "gradients/dropout_3/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_grad/Sum"
  input: "gradients/dropout_3/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_3/cond/Shape/Switch:1"
  input: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_grad/mul_1"
  input: "gradients/dropout_3/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_grad/Sum_1"
  input: "gradients/dropout_3/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/mul_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/mul_1_grad/Shape"
  input: "gradients/dropout_3/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency_1"
  input: "dropout_3/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_1_grad/mul"
  input: "gradients/dropout_3/cond/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_1_grad/Sum"
  input: "gradients/dropout_3/cond/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/mul_1"
  op: "Mul"
  input: "dropout_3/cond/alpha"
  input: "gradients/dropout_3/cond/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_1_grad/mul_1"
  input: "gradients/dropout_3/cond/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/mul_1_grad/Sum_1"
  input: "gradients/dropout_3/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/mul_grad/Shape"
  input: "gradients/dropout_1/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/mul"
  op: "Mul"
  input: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency"
  input: "dropout_1/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_grad/mul"
  input: "gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_grad/Sum"
  input: "gradients/dropout_1/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_1/cond/Shape/Switch:1"
  input: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_grad/mul_1"
  input: "gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_grad/Sum_1"
  input: "gradients/dropout_1/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/mul_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/mul_1_grad/Shape"
  input: "gradients/dropout_1/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency_1"
  input: "dropout_1/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_1_grad/mul"
  input: "gradients/dropout_1/cond/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_1_grad/Sum"
  input: "gradients/dropout_1/cond/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/mul_1"
  op: "Mul"
  input: "dropout_1/cond/alpha"
  input: "gradients/dropout_1/cond/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_1_grad/mul_1"
  input: "gradients/dropout_1/cond/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/mul_1_grad/Sum_1"
  input: "gradients/dropout_1/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/cond/sub_1_grad/Shape"
  input: "gradients/dropout_3/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/cond/sub_1_grad/Sum"
  input: "gradients/dropout_3/cond/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Neg"
  op: "Neg"
  input: "gradients/dropout_3/cond/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/cond/sub_1_grad/Neg"
  input: "gradients/dropout_3/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/sub_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_3/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/cond/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/cond/sub_1_grad/Reshape_1"
  input: "^gradients/dropout_3/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/cond/sub_1_grad/Shape"
  input: "gradients/dropout_1/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/cond/sub_1_grad/Sum"
  input: "gradients/dropout_1/cond/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Neg"
  op: "Neg"
  input: "gradients/dropout_1/cond/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/cond/sub_1_grad/Neg"
  input: "gradients/dropout_1/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/sub_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_1/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/cond/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/cond/sub_1_grad/Reshape_1"
  input: "^gradients/dropout_1/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/dropout_3/cond/mul_grad/tuple/control_dependency_1"
  input: "gradients/dropout_3/cond/sub_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/dropout_1/cond/mul_grad/tuple/control_dependency_1"
  input: "gradients/dropout_1/cond/sub_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_2"
  op: "Switch"
  input: "mul_27"
  input: "dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_3"
  op: "Shape"
  input: "gradients/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_2"
  op: "Fill"
  input: "gradients/Shape_3"
  input: "gradients/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/cond/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_3/cond/mul_grad/tuple/control_dependency"
  input: "gradients/zeros_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_3"
  op: "Switch"
  input: "mul_23"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_4"
  op: "Shape"
  input: "gradients/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_3"
  op: "Fill"
  input: "gradients/Shape_4"
  input: "gradients/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/cond/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_1/cond/mul_grad/tuple/control_dependency"
  input: "gradients/zeros_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/dropout_3/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/dropout_3/cond/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/mul_27_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_27_grad/Shape_1"
  op: "Shape"
  input: "Select_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_27_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_27_grad/Shape"
  input: "gradients/mul_27_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_27_grad/mul"
  op: "Mul"
  input: "gradients/AddN_2"
  input: "Select_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_27_grad/Sum"
  op: "Sum"
  input: "gradients/mul_27_grad/mul"
  input: "gradients/mul_27_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_27_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_27_grad/Sum"
  input: "gradients/mul_27_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_27_grad/mul_1"
  op: "Mul"
  input: "mul_27/x"
  input: "gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_27_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_27_grad/mul_1"
  input: "gradients/mul_27_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_27_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_27_grad/Sum_1"
  input: "gradients/mul_27_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_27_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_27_grad/Reshape"
  input: "^gradients/mul_27_grad/Reshape_1"
}
node {
  name: "gradients/mul_27_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_27_grad/Reshape"
  input: "^gradients/mul_27_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_27_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_27_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_27_grad/Reshape_1"
  input: "^gradients/mul_27_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_27_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/dropout_1/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/dropout_1/cond/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/mul_23_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_23_grad/Shape_1"
  op: "Shape"
  input: "Select_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_23_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_23_grad/Shape"
  input: "gradients/mul_23_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_23_grad/mul"
  op: "Mul"
  input: "gradients/AddN_3"
  input: "Select_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_23_grad/Sum"
  op: "Sum"
  input: "gradients/mul_23_grad/mul"
  input: "gradients/mul_23_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_23_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_23_grad/Sum"
  input: "gradients/mul_23_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_23_grad/mul_1"
  op: "Mul"
  input: "mul_23/x"
  input: "gradients/AddN_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_23_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_23_grad/mul_1"
  input: "gradients/mul_23_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_23_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_23_grad/Sum_1"
  input: "gradients/mul_23_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_23_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_23_grad/Reshape"
  input: "^gradients/mul_23_grad/Reshape_1"
}
node {
  name: "gradients/mul_23_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_23_grad/Reshape"
  input: "^gradients/mul_23_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_23_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_23_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_23_grad/Reshape_1"
  input: "^gradients/mul_23_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_23_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_13_grad/zeros_like"
  op: "ZerosLike"
  input: "Add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_13_grad/Select"
  op: "Select"
  input: "GreaterEqual_13"
  input: "gradients/mul_27_grad/tuple/control_dependency_1"
  input: "gradients/Select_13_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_13_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_13"
  input: "gradients/Select_13_grad/zeros_like"
  input: "gradients/mul_27_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_13_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_13_grad/Select"
  input: "^gradients/Select_13_grad/Select_1"
}
node {
  name: "gradients/Select_13_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_13_grad/Select"
  input: "^gradients/Select_13_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_13_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_13_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_13_grad/Select_1"
  input: "^gradients/Select_13_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_13_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_11_grad/zeros_like"
  op: "ZerosLike"
  input: "Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_11_grad/Select"
  op: "Select"
  input: "GreaterEqual_11"
  input: "gradients/mul_23_grad/tuple/control_dependency_1"
  input: "gradients/Select_11_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_11_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_11"
  input: "gradients/Select_11_grad/zeros_like"
  input: "gradients/mul_23_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_11_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_11_grad/Select"
  input: "^gradients/Select_11_grad/Select_1"
}
node {
  name: "gradients/Select_11_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_11_grad/Select"
  input: "^gradients/Select_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_11_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_11_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_11_grad/Select_1"
  input: "^gradients/Select_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_11_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_26_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_26_grad/Shape_1"
  op: "Shape"
  input: "Elu_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_26_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_26_grad/Shape"
  input: "gradients/mul_26_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_26_grad/mul"
  op: "Mul"
  input: "gradients/Select_13_grad/tuple/control_dependency_1"
  input: "Elu_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_26_grad/Sum"
  op: "Sum"
  input: "gradients/mul_26_grad/mul"
  input: "gradients/mul_26_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_26_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_26_grad/Sum"
  input: "gradients/mul_26_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_26_grad/mul_1"
  op: "Mul"
  input: "mul_26/x"
  input: "gradients/Select_13_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_26_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_26_grad/mul_1"
  input: "gradients/mul_26_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_26_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_26_grad/Sum_1"
  input: "gradients/mul_26_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_26_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_26_grad/Reshape"
  input: "^gradients/mul_26_grad/Reshape_1"
}
node {
  name: "gradients/mul_26_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_26_grad/Reshape"
  input: "^gradients/mul_26_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_26_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_26_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_26_grad/Reshape_1"
  input: "^gradients/mul_26_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_26_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_22_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_22_grad/Shape_1"
  op: "Shape"
  input: "Elu_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_22_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_22_grad/Shape"
  input: "gradients/mul_22_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_22_grad/mul"
  op: "Mul"
  input: "gradients/Select_11_grad/tuple/control_dependency_1"
  input: "Elu_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_22_grad/Sum"
  op: "Sum"
  input: "gradients/mul_22_grad/mul"
  input: "gradients/mul_22_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_22_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_22_grad/Sum"
  input: "gradients/mul_22_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_22_grad/mul_1"
  op: "Mul"
  input: "mul_22/x"
  input: "gradients/Select_11_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_22_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_22_grad/mul_1"
  input: "gradients/mul_22_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_22_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_22_grad/Sum_1"
  input: "gradients/mul_22_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_22_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_22_grad/Reshape"
  input: "^gradients/mul_22_grad/Reshape_1"
}
node {
  name: "gradients/mul_22_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_22_grad/Reshape"
  input: "^gradients/mul_22_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_22_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_22_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_22_grad/Reshape_1"
  input: "^gradients/mul_22_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_22_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_13_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_26_grad/tuple/control_dependency_1"
  input: "Elu_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_11_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_22_grad/tuple/control_dependency_1"
  input: "Elu_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_4"
  op: "AddN"
  input: "gradients/Select_13_grad/tuple/control_dependency"
  input: "gradients/Elu_13_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_13_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/Shape"
  op: "Shape"
  input: "MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_1_grad/Shape"
  input: "gradients/Add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_4"
  input: "gradients/Add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_1_grad/Sum"
  input: "gradients/Add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_4"
  input: "gradients/Add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_1_grad/Sum_1"
  input: "gradients/Add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_1_grad/Reshape"
  input: "^gradients/Add_1_grad/Reshape_1"
}
node {
  name: "gradients/Add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_1_grad/Reshape"
  input: "^gradients/Add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_1_grad/Reshape_1"
  input: "^gradients/Add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_5"
  op: "AddN"
  input: "gradients/Select_11_grad/tuple/control_dependency"
  input: "gradients/Elu_11_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_11_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Add_grad/Shape"
  op: "Shape"
  input: "MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/Add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_grad/Shape"
  input: "gradients/Add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_5"
  input: "gradients/Add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_grad/Sum"
  input: "gradients/Add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_5"
  input: "gradients/Add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_grad/Sum_1"
  input: "gradients/Add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/Reshape_1"
}
node {
  name: "gradients/Add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_grad/Reshape_1"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_1_grad/tuple/control_dependency"
  input: "Variable_20/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_2/cond/Merge"
  input: "gradients/Add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_1_grad/MatMul"
  input: "^gradients/MatMul_1_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_1_grad/MatMul"
  input: "^gradients/MatMul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_1_grad/MatMul_1"
  input: "^gradients/MatMul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_grad/tuple/control_dependency"
  input: "Variable_16/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout/cond/Merge"
  input: "gradients/Add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul_1"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/MatMul_1_grad/tuple/control_dependency"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/dropout_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/Merge_grad/cond_grad"
  input: "^gradients/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/MatMul_grad/tuple/control_dependency"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/dropout/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/Merge_grad/cond_grad"
  input: "^gradients/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/Merge_grad/cond_grad:1"
  input: "^gradients/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/add_4_grad/Shape"
  input: "gradients/dropout_2/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/add_4_grad/Sum"
  input: "gradients/dropout_2/cond/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/add_4_grad/Sum_1"
  input: "gradients/dropout_2/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_2/cond/add_4_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/add_4_grad/Reshape"
  input: "^gradients/dropout_2/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/add_4_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Shape"
  op: "Shape"
  input: "dropout/cond/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/add_4_grad/Shape"
  input: "gradients/dropout/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/add_4_grad/Sum"
  input: "gradients/dropout/cond/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/Merge_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/add_4_grad/Sum_1"
  input: "gradients/dropout/cond/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/add_4_grad/Reshape"
  input: "^gradients/dropout/cond/add_4_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/add_4_grad/Reshape"
  input: "^gradients/dropout/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/add_4_grad/Reshape_1"
  input: "^gradients/dropout/cond/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_4"
  op: "Switch"
  input: "Reshape_1"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_5"
  op: "Shape"
  input: "gradients/Switch_4:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_4"
  op: "Fill"
  input: "gradients/Shape_5"
  input: "gradients/zeros_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_2/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/Sqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/mul_7_grad/Shape"
  input: "gradients/dropout_2/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/mul"
  op: "Mul"
  input: "gradients/dropout_2/cond/add_4_grad/tuple/control_dependency"
  input: "dropout_2/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_7_grad/mul"
  input: "gradients/dropout_2/cond/mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_7_grad/Sum"
  input: "gradients/dropout_2/cond/mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/mul_1"
  op: "Mul"
  input: "dropout_2/cond/Sqrt"
  input: "gradients/dropout_2/cond/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_7_grad/mul_1"
  input: "gradients/dropout_2/cond/mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_7_grad/Sum_1"
  input: "gradients/dropout_2/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_7_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_7_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_5"
  op: "Switch"
  input: "Reshape"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_6"
  op: "Shape"
  input: "gradients/Switch_5:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_5/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_5"
  op: "Fill"
  input: "gradients/Shape_6"
  input: "gradients/zeros_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Shape"
  op: "Shape"
  input: "dropout/cond/Sqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/mul_7_grad/Shape"
  input: "gradients/dropout/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/mul"
  op: "Mul"
  input: "gradients/dropout/cond/add_4_grad/tuple/control_dependency"
  input: "dropout/cond/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/mul_7_grad/mul"
  input: "gradients/dropout/cond/mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_7_grad/Sum"
  input: "gradients/dropout/cond/mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/mul_1"
  op: "Mul"
  input: "dropout/cond/Sqrt"
  input: "gradients/dropout/cond/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/mul_7_grad/mul_1"
  input: "gradients/dropout/cond/mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_7_grad/Sum_1"
  input: "gradients/dropout/cond/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout/cond/mul_7_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/mul_7_grad/Reshape"
  input: "^gradients/dropout/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/mul_7_grad/Reshape_1"
  input: "^gradients/dropout/cond/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/add_1_grad/Shape"
  input: "gradients/dropout_2/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/add_1_grad/Sum"
  input: "gradients/dropout_2/cond/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/add_1_grad/Sum_1"
  input: "gradients/dropout_2/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/add_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/add_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/add_1_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Shape"
  op: "Shape"
  input: "dropout/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/add_1_grad/Shape"
  input: "gradients/dropout/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/add_1_grad/Sum"
  input: "gradients/dropout/cond/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/add_1_grad/Sum_1"
  input: "gradients/dropout/cond/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/add_1_grad/Reshape"
  input: "^gradients/dropout/cond/add_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/add_1_grad/Reshape"
  input: "^gradients/dropout/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/add_1_grad/Reshape_1"
  input: "^gradients/dropout/cond/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/mul_grad/Shape"
  input: "gradients/dropout_2/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/mul"
  op: "Mul"
  input: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency"
  input: "dropout_2/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_grad/mul"
  input: "gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_grad/Sum"
  input: "gradients/dropout_2/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_2/cond/Shape/Switch:1"
  input: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_grad/mul_1"
  input: "gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_grad/Sum_1"
  input: "gradients/dropout_2/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/mul_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/mul_1_grad/Shape"
  input: "gradients/dropout_2/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency_1"
  input: "dropout_2/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_1_grad/mul"
  input: "gradients/dropout_2/cond/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_1_grad/Sum"
  input: "gradients/dropout_2/cond/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/mul_1"
  op: "Mul"
  input: "dropout_2/cond/alpha"
  input: "gradients/dropout_2/cond/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_1_grad/mul_1"
  input: "gradients/dropout_2/cond/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/mul_1_grad/Sum_1"
  input: "gradients/dropout_2/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout/cond/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/mul_grad/Shape"
  input: "gradients/dropout/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/mul"
  op: "Mul"
  input: "gradients/dropout/cond/add_1_grad/tuple/control_dependency"
  input: "dropout/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/mul_grad/mul"
  input: "gradients/dropout/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_grad/Sum"
  input: "gradients/dropout/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout/cond/Shape/Switch:1"
  input: "gradients/dropout/cond/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/mul_grad/mul_1"
  input: "gradients/dropout/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_grad/Sum_1"
  input: "gradients/dropout/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/mul_grad/Reshape"
  input: "^gradients/dropout/cond/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/mul_grad/Reshape"
  input: "^gradients/dropout/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/mul_grad/Reshape_1"
  input: "^gradients/dropout/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/mul_1_grad/Shape"
  input: "gradients/dropout/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/dropout/cond/add_1_grad/tuple/control_dependency_1"
  input: "dropout/cond/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/mul_1_grad/mul"
  input: "gradients/dropout/cond/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_1_grad/Sum"
  input: "gradients/dropout/cond/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/mul_1"
  op: "Mul"
  input: "dropout/cond/alpha"
  input: "gradients/dropout/cond/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/mul_1_grad/mul_1"
  input: "gradients/dropout/cond/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/mul_1_grad/Sum_1"
  input: "gradients/dropout/cond/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout/cond/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/mul_1_grad/Reshape"
  input: "^gradients/dropout/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/mul_1_grad/Reshape_1"
  input: "^gradients/dropout/cond/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/cond/sub_1_grad/Shape"
  input: "gradients/dropout_2/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/cond/sub_1_grad/Sum"
  input: "gradients/dropout_2/cond/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Neg"
  op: "Neg"
  input: "gradients/dropout_2/cond/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/cond/sub_1_grad/Neg"
  input: "gradients/dropout_2/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/sub_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout_2/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/cond/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/cond/sub_1_grad/Reshape_1"
  input: "^gradients/dropout_2/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Shape_1"
  op: "Shape"
  input: "dropout/cond/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/cond/sub_1_grad/Shape"
  input: "gradients/dropout/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/cond/sub_1_grad/Sum"
  input: "gradients/dropout/cond/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/cond/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Neg"
  op: "Neg"
  input: "gradients/dropout/cond/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/cond/sub_1_grad/Neg"
  input: "gradients/dropout/cond/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout/cond/sub_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout/cond/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/cond/sub_1_grad/Reshape"
  input: "^gradients/dropout/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/cond/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/cond/sub_1_grad/Reshape_1"
  input: "^gradients/dropout/cond/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_6"
  op: "AddN"
  input: "gradients/dropout_2/cond/mul_grad/tuple/control_dependency_1"
  input: "gradients/dropout_2/cond/sub_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_7"
  op: "AddN"
  input: "gradients/dropout/cond/mul_grad/tuple/control_dependency_1"
  input: "gradients/dropout/cond/sub_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_6"
  op: "Switch"
  input: "Reshape_1"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_7"
  op: "Shape"
  input: "gradients/Switch_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_6/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_6"
  op: "Fill"
  input: "gradients/Shape_7"
  input: "gradients/zeros_6/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/cond/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout_2/cond/mul_grad/tuple/control_dependency"
  input: "gradients/zeros_6"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Switch_7"
  op: "Switch"
  input: "Reshape"
  input: "dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_8"
  op: "Shape"
  input: "gradients/Switch_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_7/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_7"
  op: "Fill"
  input: "gradients/Shape_8"
  input: "gradients/zeros_7/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/cond/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/dropout/cond/mul_grad/tuple/control_dependency"
  input: "gradients/zeros_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_8"
  op: "AddN"
  input: "gradients/dropout_2/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/dropout_2/cond/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/Reshape_1_grad/Shape"
  op: "Shape"
  input: "MaxPool_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_8"
  input: "gradients/Reshape_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AddN_9"
  op: "AddN"
  input: "gradients/dropout/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/dropout/cond/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "MaxPool_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_9"
  input: "gradients/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/MaxPool_11_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_25"
  input: "MaxPool_11"
  input: "gradients/Reshape_1_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_10_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_21"
  input: "MaxPool_10"
  input: "gradients/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/mul_25_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_25_grad/Shape_1"
  op: "Shape"
  input: "Select_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_25_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_25_grad/Shape"
  input: "gradients/mul_25_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_25_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_11_grad/MaxPoolGrad"
  input: "Select_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_25_grad/Sum"
  op: "Sum"
  input: "gradients/mul_25_grad/mul"
  input: "gradients/mul_25_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_25_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_25_grad/Sum"
  input: "gradients/mul_25_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_25_grad/mul_1"
  op: "Mul"
  input: "mul_25/x"
  input: "gradients/MaxPool_11_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_25_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_25_grad/mul_1"
  input: "gradients/mul_25_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_25_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_25_grad/Sum_1"
  input: "gradients/mul_25_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_25_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_25_grad/Reshape"
  input: "^gradients/mul_25_grad/Reshape_1"
}
node {
  name: "gradients/mul_25_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_25_grad/Reshape"
  input: "^gradients/mul_25_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_25_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_25_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_25_grad/Reshape_1"
  input: "^gradients/mul_25_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_25_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_21_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_21_grad/Shape_1"
  op: "Shape"
  input: "Select_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_21_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_21_grad/Shape"
  input: "gradients/mul_21_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_21_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_10_grad/MaxPoolGrad"
  input: "Select_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_21_grad/Sum"
  op: "Sum"
  input: "gradients/mul_21_grad/mul"
  input: "gradients/mul_21_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_21_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_21_grad/Sum"
  input: "gradients/mul_21_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_21_grad/mul_1"
  op: "Mul"
  input: "mul_21/x"
  input: "gradients/MaxPool_10_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_21_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_21_grad/mul_1"
  input: "gradients/mul_21_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_21_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_21_grad/Sum_1"
  input: "gradients/mul_21_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_21_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_21_grad/Reshape"
  input: "^gradients/mul_21_grad/Reshape_1"
}
node {
  name: "gradients/mul_21_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_21_grad/Reshape"
  input: "^gradients/mul_21_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_21_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_21_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_21_grad/Reshape_1"
  input: "^gradients/mul_21_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_21_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_12_grad/zeros_like"
  op: "ZerosLike"
  input: "add_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_12_grad/Select"
  op: "Select"
  input: "GreaterEqual_12"
  input: "gradients/mul_25_grad/tuple/control_dependency_1"
  input: "gradients/Select_12_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_12_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_12"
  input: "gradients/Select_12_grad/zeros_like"
  input: "gradients/mul_25_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_12_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_12_grad/Select"
  input: "^gradients/Select_12_grad/Select_1"
}
node {
  name: "gradients/Select_12_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_12_grad/Select"
  input: "^gradients/Select_12_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_12_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_12_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_12_grad/Select_1"
  input: "^gradients/Select_12_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_12_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_10_grad/zeros_like"
  op: "ZerosLike"
  input: "add_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_10_grad/Select"
  op: "Select"
  input: "GreaterEqual_10"
  input: "gradients/mul_21_grad/tuple/control_dependency_1"
  input: "gradients/Select_10_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_10_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_10"
  input: "gradients/Select_10_grad/zeros_like"
  input: "gradients/mul_21_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_10_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_10_grad/Select"
  input: "^gradients/Select_10_grad/Select_1"
}
node {
  name: "gradients/Select_10_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_10_grad/Select"
  input: "^gradients/Select_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_10_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_10_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_10_grad/Select_1"
  input: "^gradients/Select_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_10_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_24_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_24_grad/Shape_1"
  op: "Shape"
  input: "Elu_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_24_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_24_grad/Shape"
  input: "gradients/mul_24_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_24_grad/mul"
  op: "Mul"
  input: "gradients/Select_12_grad/tuple/control_dependency_1"
  input: "Elu_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_24_grad/Sum"
  op: "Sum"
  input: "gradients/mul_24_grad/mul"
  input: "gradients/mul_24_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_24_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_24_grad/Sum"
  input: "gradients/mul_24_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_24_grad/mul_1"
  op: "Mul"
  input: "mul_24/x"
  input: "gradients/Select_12_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_24_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_24_grad/mul_1"
  input: "gradients/mul_24_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_24_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_24_grad/Sum_1"
  input: "gradients/mul_24_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_24_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_24_grad/Reshape"
  input: "^gradients/mul_24_grad/Reshape_1"
}
node {
  name: "gradients/mul_24_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_24_grad/Reshape"
  input: "^gradients/mul_24_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_24_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_24_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_24_grad/Reshape_1"
  input: "^gradients/mul_24_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_24_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_20_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_20_grad/Shape_1"
  op: "Shape"
  input: "Elu_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_20_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_20_grad/Shape"
  input: "gradients/mul_20_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_20_grad/mul"
  op: "Mul"
  input: "gradients/Select_10_grad/tuple/control_dependency_1"
  input: "Elu_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_20_grad/Sum"
  op: "Sum"
  input: "gradients/mul_20_grad/mul"
  input: "gradients/mul_20_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_20_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_20_grad/Sum"
  input: "gradients/mul_20_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_20_grad/mul_1"
  op: "Mul"
  input: "mul_20/x"
  input: "gradients/Select_10_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_20_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_20_grad/mul_1"
  input: "gradients/mul_20_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_20_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_20_grad/Sum_1"
  input: "gradients/mul_20_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_20_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_20_grad/Reshape"
  input: "^gradients/mul_20_grad/Reshape_1"
}
node {
  name: "gradients/mul_20_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_20_grad/Reshape"
  input: "^gradients/mul_20_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_20_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_20_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_20_grad/Reshape_1"
  input: "^gradients/mul_20_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_20_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_12_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_24_grad/tuple/control_dependency_1"
  input: "Elu_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_10_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_20_grad/tuple/control_dependency_1"
  input: "Elu_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_10"
  op: "AddN"
  input: "gradients/Select_12_grad/tuple/control_dependency"
  input: "gradients/Elu_12_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_12_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_11_grad/Shape"
  op: "Shape"
  input: "Conv2D_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_11_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_11_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_11_grad/Shape"
  input: "gradients/add_11_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_11_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_10"
  input: "gradients/add_11_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_11_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_11_grad/Sum"
  input: "gradients/add_11_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_11_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_10"
  input: "gradients/add_11_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_11_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_11_grad/Sum_1"
  input: "gradients/add_11_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_11_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_11_grad/Reshape"
  input: "^gradients/add_11_grad/Reshape_1"
}
node {
  name: "gradients/add_11_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_11_grad/Reshape"
  input: "^gradients/add_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_11_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_11_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_11_grad/Reshape_1"
  input: "^gradients/add_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_11_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_11"
  op: "AddN"
  input: "gradients/Select_10_grad/tuple/control_dependency"
  input: "gradients/Elu_10_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_10_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_10_grad/Shape"
  op: "Shape"
  input: "Conv2D_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_10_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_10_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_10_grad/Shape"
  input: "gradients/add_10_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_10_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_11"
  input: "gradients/add_10_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_10_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_10_grad/Sum"
  input: "gradients/add_10_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_10_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_11"
  input: "gradients/add_10_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_10_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_10_grad/Sum_1"
  input: "gradients/add_10_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_10_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_10_grad/Reshape"
  input: "^gradients/add_10_grad/Reshape_1"
}
node {
  name: "gradients/add_10_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_10_grad/Reshape"
  input: "^gradients/add_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_10_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_10_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_10_grad/Reshape_1"
  input: "^gradients/add_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_10_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/Shape"
  op: "Shape"
  input: "concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_11_grad/Shape"
  input: "Variable_18/read"
  input: "gradients/add_11_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000 \000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "concat"
  input: "gradients/Conv2D_11_grad/Shape_1"
  input: "gradients/add_11_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_11_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_11_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_11_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_11_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_11_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_11_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_11_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_11_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/Shape"
  op: "Shape"
  input: "MaxPool_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_10_grad/Shape"
  input: "Variable_14/read"
  input: "gradients/add_10_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000 \000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_9"
  input: "gradients/Conv2D_10_grad/Shape_1"
  input: "gradients/add_10_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_10_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_10_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_10_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_10_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_10_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_10_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_10_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_10_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/concat_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/concat_grad/mod"
  op: "FloorMod"
  input: "concat/axis"
  input: "gradients/concat_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/Shape"
  op: "Shape"
  input: "MaxPool_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/ShapeN"
  op: "ShapeN"
  input: "MaxPool_4"
  input: "MaxPool_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_grad/mod"
  input: "gradients/concat_grad/ShapeN"
  input: "gradients/concat_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_grad/Slice"
  op: "Slice"
  input: "gradients/Conv2D_11_grad/tuple/control_dependency"
  input: "gradients/concat_grad/ConcatOffset"
  input: "gradients/concat_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_grad/Slice_1"
  op: "Slice"
  input: "gradients/Conv2D_11_grad/tuple/control_dependency"
  input: "gradients/concat_grad/ConcatOffset:1"
  input: "gradients/concat_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_grad/Slice"
  input: "^gradients/concat_grad/Slice_1"
}
node {
  name: "gradients/concat_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_grad/Slice"
  input: "^gradients/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_grad/Slice_1"
  input: "^gradients/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_9_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_19"
  input: "MaxPool_9"
  input: "gradients/Conv2D_10_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_4_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_9"
  input: "MaxPool_4"
  input: "gradients/concat_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_5_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_11"
  input: "MaxPool_5"
  input: "gradients/concat_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/mul_19_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_19_grad/Shape_1"
  op: "Shape"
  input: "Select_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_19_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_19_grad/Shape"
  input: "gradients/mul_19_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_19_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_9_grad/MaxPoolGrad"
  input: "Select_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_19_grad/Sum"
  op: "Sum"
  input: "gradients/mul_19_grad/mul"
  input: "gradients/mul_19_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_19_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_19_grad/Sum"
  input: "gradients/mul_19_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_19_grad/mul_1"
  op: "Mul"
  input: "mul_19/x"
  input: "gradients/MaxPool_9_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_19_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_19_grad/mul_1"
  input: "gradients/mul_19_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_19_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_19_grad/Sum_1"
  input: "gradients/mul_19_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_19_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_19_grad/Reshape"
  input: "^gradients/mul_19_grad/Reshape_1"
}
node {
  name: "gradients/mul_19_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_19_grad/Reshape"
  input: "^gradients/mul_19_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_19_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_19_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_19_grad/Reshape_1"
  input: "^gradients/mul_19_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_19_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_9_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_9_grad/Shape_1"
  op: "Shape"
  input: "Select_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_9_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_9_grad/Shape"
  input: "gradients/mul_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_9_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_4_grad/MaxPoolGrad"
  input: "Select_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_9_grad/Sum"
  op: "Sum"
  input: "gradients/mul_9_grad/mul"
  input: "gradients/mul_9_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_9_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_9_grad/Sum"
  input: "gradients/mul_9_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_9_grad/mul_1"
  op: "Mul"
  input: "mul_9/x"
  input: "gradients/MaxPool_4_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_9_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_9_grad/mul_1"
  input: "gradients/mul_9_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_9_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_9_grad/Sum_1"
  input: "gradients/mul_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_9_grad/Reshape"
  input: "^gradients/mul_9_grad/Reshape_1"
}
node {
  name: "gradients/mul_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_9_grad/Reshape"
  input: "^gradients/mul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_9_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_9_grad/Reshape_1"
  input: "^gradients/mul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_9_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_11_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_11_grad/Shape_1"
  op: "Shape"
  input: "Select_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_11_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_11_grad/Shape"
  input: "gradients/mul_11_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_11_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_5_grad/MaxPoolGrad"
  input: "Select_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_11_grad/Sum"
  op: "Sum"
  input: "gradients/mul_11_grad/mul"
  input: "gradients/mul_11_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_11_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_11_grad/Sum"
  input: "gradients/mul_11_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_11_grad/mul_1"
  op: "Mul"
  input: "mul_11/x"
  input: "gradients/MaxPool_5_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_11_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_11_grad/mul_1"
  input: "gradients/mul_11_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_11_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_11_grad/Sum_1"
  input: "gradients/mul_11_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_11_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_11_grad/Reshape"
  input: "^gradients/mul_11_grad/Reshape_1"
}
node {
  name: "gradients/mul_11_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_11_grad/Reshape"
  input: "^gradients/mul_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_11_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_11_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_11_grad/Reshape_1"
  input: "^gradients/mul_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_11_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_9_grad/zeros_like"
  op: "ZerosLike"
  input: "add_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_9_grad/Select"
  op: "Select"
  input: "GreaterEqual_9"
  input: "gradients/mul_19_grad/tuple/control_dependency_1"
  input: "gradients/Select_9_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_9_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_9"
  input: "gradients/Select_9_grad/zeros_like"
  input: "gradients/mul_19_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_9_grad/Select"
  input: "^gradients/Select_9_grad/Select_1"
}
node {
  name: "gradients/Select_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_9_grad/Select"
  input: "^gradients/Select_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_9_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_9_grad/Select_1"
  input: "^gradients/Select_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_9_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_4_grad/zeros_like"
  op: "ZerosLike"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_4_grad/Select"
  op: "Select"
  input: "GreaterEqual_4"
  input: "gradients/mul_9_grad/tuple/control_dependency_1"
  input: "gradients/Select_4_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_4_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_4"
  input: "gradients/Select_4_grad/zeros_like"
  input: "gradients/mul_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_4_grad/Select"
  input: "^gradients/Select_4_grad/Select_1"
}
node {
  name: "gradients/Select_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_4_grad/Select"
  input: "^gradients/Select_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_4_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_4_grad/Select_1"
  input: "^gradients/Select_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_4_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_5_grad/zeros_like"
  op: "ZerosLike"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_5_grad/Select"
  op: "Select"
  input: "GreaterEqual_5"
  input: "gradients/mul_11_grad/tuple/control_dependency_1"
  input: "gradients/Select_5_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_5_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_5"
  input: "gradients/Select_5_grad/zeros_like"
  input: "gradients/mul_11_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_5_grad/Select"
  input: "^gradients/Select_5_grad/Select_1"
}
node {
  name: "gradients/Select_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_5_grad/Select"
  input: "^gradients/Select_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_5_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_5_grad/Select_1"
  input: "^gradients/Select_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_5_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_18_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_18_grad/Shape_1"
  op: "Shape"
  input: "Elu_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_18_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_18_grad/Shape"
  input: "gradients/mul_18_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_18_grad/mul"
  op: "Mul"
  input: "gradients/Select_9_grad/tuple/control_dependency_1"
  input: "Elu_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_18_grad/Sum"
  op: "Sum"
  input: "gradients/mul_18_grad/mul"
  input: "gradients/mul_18_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_18_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_18_grad/Sum"
  input: "gradients/mul_18_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_18_grad/mul_1"
  op: "Mul"
  input: "mul_18/x"
  input: "gradients/Select_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_18_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_18_grad/mul_1"
  input: "gradients/mul_18_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_18_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_18_grad/Sum_1"
  input: "gradients/mul_18_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_18_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_18_grad/Reshape"
  input: "^gradients/mul_18_grad/Reshape_1"
}
node {
  name: "gradients/mul_18_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_18_grad/Reshape"
  input: "^gradients/mul_18_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_18_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_18_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_18_grad/Reshape_1"
  input: "^gradients/mul_18_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_18_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_8_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_8_grad/Shape_1"
  op: "Shape"
  input: "Elu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_8_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_8_grad/Shape"
  input: "gradients/mul_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_8_grad/mul"
  op: "Mul"
  input: "gradients/Select_4_grad/tuple/control_dependency_1"
  input: "Elu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_8_grad/Sum"
  op: "Sum"
  input: "gradients/mul_8_grad/mul"
  input: "gradients/mul_8_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_8_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_8_grad/Sum"
  input: "gradients/mul_8_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_8_grad/mul_1"
  op: "Mul"
  input: "mul_8/x"
  input: "gradients/Select_4_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_8_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_8_grad/mul_1"
  input: "gradients/mul_8_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_8_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_8_grad/Sum_1"
  input: "gradients/mul_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_8_grad/Reshape"
  input: "^gradients/mul_8_grad/Reshape_1"
}
node {
  name: "gradients/mul_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_8_grad/Reshape"
  input: "^gradients/mul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_8_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_8_grad/Reshape_1"
  input: "^gradients/mul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_8_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_10_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_10_grad/Shape_1"
  op: "Shape"
  input: "Elu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_10_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_10_grad/Shape"
  input: "gradients/mul_10_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_10_grad/mul"
  op: "Mul"
  input: "gradients/Select_5_grad/tuple/control_dependency_1"
  input: "Elu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_10_grad/Sum"
  op: "Sum"
  input: "gradients/mul_10_grad/mul"
  input: "gradients/mul_10_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_10_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_10_grad/Sum"
  input: "gradients/mul_10_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_10_grad/mul_1"
  op: "Mul"
  input: "mul_10/x"
  input: "gradients/Select_5_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_10_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_10_grad/mul_1"
  input: "gradients/mul_10_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_10_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_10_grad/Sum_1"
  input: "gradients/mul_10_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_10_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_10_grad/Reshape"
  input: "^gradients/mul_10_grad/Reshape_1"
}
node {
  name: "gradients/mul_10_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_10_grad/Reshape"
  input: "^gradients/mul_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_10_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_10_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_10_grad/Reshape_1"
  input: "^gradients/mul_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_10_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_9_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_18_grad/tuple/control_dependency_1"
  input: "Elu_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_4_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_8_grad/tuple/control_dependency_1"
  input: "Elu_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_5_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_10_grad/tuple/control_dependency_1"
  input: "Elu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_12"
  op: "AddN"
  input: "gradients/Select_9_grad/tuple/control_dependency"
  input: "gradients/Elu_9_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_9_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/Shape"
  op: "Shape"
  input: "Conv2D_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_9_grad/Shape"
  input: "gradients/add_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_12"
  input: "gradients/add_9_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_9_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_9_grad/Sum"
  input: "gradients/add_9_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_12"
  input: "gradients/add_9_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_9_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_9_grad/Sum_1"
  input: "gradients/add_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_9_grad/Reshape"
  input: "^gradients/add_9_grad/Reshape_1"
}
node {
  name: "gradients/add_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_9_grad/Reshape"
  input: "^gradients/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_9_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_9_grad/Reshape_1"
  input: "^gradients/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_9_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_13"
  op: "AddN"
  input: "gradients/Select_4_grad/tuple/control_dependency"
  input: "gradients/Elu_4_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_4_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape"
  op: "Shape"
  input: "Conv2D_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 16
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_4_grad/Shape"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_13"
  input: "gradients/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum"
  input: "gradients/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_13"
  input: "gradients/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum_1"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/Reshape_1"
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape_1"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_14"
  op: "AddN"
  input: "gradients/Select_5_grad/tuple/control_dependency"
  input: "gradients/Elu_5_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_5_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape"
  op: "Shape"
  input: "Conv2D_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 16
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_5_grad/Shape"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_14"
  input: "gradients/add_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum"
  input: "gradients/add_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_14"
  input: "gradients/add_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum_1"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/Reshape_1"
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape_1"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/Shape"
  op: "Shape"
  input: "MaxPool_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_9_grad/Shape"
  input: "Variable_12/read"
  input: "gradients/add_9_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\020\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_8"
  input: "gradients/Conv2D_9_grad/Shape_1"
  input: "gradients/add_9_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_9_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_9_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_9_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_9_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_9_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_9_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Shape"
  op: "Shape"
  input: "MaxPool_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_4_grad/Shape"
  input: "Variable_4/read"
  input: "gradients/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\014\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_2"
  input: "gradients/Conv2D_4_grad/Shape_1"
  input: "gradients/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_4_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_4_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_4_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_4_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_4_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_4_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Shape"
  op: "Shape"
  input: "MaxPool_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_5_grad/Shape"
  input: "Variable_4/read"
  input: "gradients/add_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\014\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_3"
  input: "gradients/Conv2D_5_grad/Shape_1"
  input: "gradients/add_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_5_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_5_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_5_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_5_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_5_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_5_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/AddN_15"
  op: "AddN"
  input: "gradients/add_4_grad/tuple/control_dependency_1"
  input: "gradients/add_5_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_8_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_17"
  input: "MaxPool_8"
  input: "gradients/Conv2D_9_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_2_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_5"
  input: "MaxPool_2"
  input: "gradients/Conv2D_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_3_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_7"
  input: "MaxPool_3"
  input: "gradients/Conv2D_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/AddN_16"
  op: "AddN"
  input: "gradients/Conv2D_4_grad/tuple/control_dependency_1"
  input: "gradients/Conv2D_5_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_4_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/mul_17_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_17_grad/Shape_1"
  op: "Shape"
  input: "Select_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_17_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_17_grad/Shape"
  input: "gradients/mul_17_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_17_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_8_grad/MaxPoolGrad"
  input: "Select_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_17_grad/Sum"
  op: "Sum"
  input: "gradients/mul_17_grad/mul"
  input: "gradients/mul_17_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_17_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_17_grad/Sum"
  input: "gradients/mul_17_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_17_grad/mul_1"
  op: "Mul"
  input: "mul_17/x"
  input: "gradients/MaxPool_8_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_17_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_17_grad/mul_1"
  input: "gradients/mul_17_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_17_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_17_grad/Sum_1"
  input: "gradients/mul_17_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_17_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_17_grad/Reshape"
  input: "^gradients/mul_17_grad/Reshape_1"
}
node {
  name: "gradients/mul_17_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_17_grad/Reshape"
  input: "^gradients/mul_17_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_17_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_17_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_17_grad/Reshape_1"
  input: "^gradients/mul_17_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_17_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_5_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_5_grad/Shape_1"
  op: "Shape"
  input: "Select_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_5_grad/Shape"
  input: "gradients/mul_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_2_grad/MaxPoolGrad"
  input: "Select_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_5_grad/Sum"
  op: "Sum"
  input: "gradients/mul_5_grad/mul"
  input: "gradients/mul_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_5_grad/Sum"
  input: "gradients/mul_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/mul_1"
  op: "Mul"
  input: "mul_5/x"
  input: "gradients/MaxPool_2_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_5_grad/mul_1"
  input: "gradients/mul_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_5_grad/Sum_1"
  input: "gradients/mul_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_5_grad/Reshape"
  input: "^gradients/mul_5_grad/Reshape_1"
}
node {
  name: "gradients/mul_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_5_grad/Reshape"
  input: "^gradients/mul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_5_grad/Reshape_1"
  input: "^gradients/mul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_7_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_7_grad/Shape_1"
  op: "Shape"
  input: "Select_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_7_grad/Shape"
  input: "gradients/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_7_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_3_grad/MaxPoolGrad"
  input: "Select_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/mul_7_grad/mul"
  input: "gradients/mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_7_grad/Sum"
  input: "gradients/mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_7_grad/mul_1"
  op: "Mul"
  input: "mul_7/x"
  input: "gradients/MaxPool_3_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_7_grad/mul_1"
  input: "gradients/mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_7_grad/Sum_1"
  input: "gradients/mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_7_grad/Reshape"
  input: "^gradients/mul_7_grad/Reshape_1"
}
node {
  name: "gradients/mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_7_grad/Reshape"
  input: "^gradients/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_7_grad/Reshape_1"
  input: "^gradients/mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_8_grad/zeros_like"
  op: "ZerosLike"
  input: "add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_8_grad/Select"
  op: "Select"
  input: "GreaterEqual_8"
  input: "gradients/mul_17_grad/tuple/control_dependency_1"
  input: "gradients/Select_8_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_8_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_8"
  input: "gradients/Select_8_grad/zeros_like"
  input: "gradients/mul_17_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_8_grad/Select"
  input: "^gradients/Select_8_grad/Select_1"
}
node {
  name: "gradients/Select_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_8_grad/Select"
  input: "^gradients/Select_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_8_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_8_grad/Select_1"
  input: "^gradients/Select_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_8_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_2_grad/zeros_like"
  op: "ZerosLike"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_2_grad/Select"
  op: "Select"
  input: "GreaterEqual_2"
  input: "gradients/mul_5_grad/tuple/control_dependency_1"
  input: "gradients/Select_2_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_2_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_2"
  input: "gradients/Select_2_grad/zeros_like"
  input: "gradients/mul_5_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_2_grad/Select"
  input: "^gradients/Select_2_grad/Select_1"
}
node {
  name: "gradients/Select_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_2_grad/Select"
  input: "^gradients/Select_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_2_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_2_grad/Select_1"
  input: "^gradients/Select_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_2_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_3_grad/zeros_like"
  op: "ZerosLike"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_3_grad/Select"
  op: "Select"
  input: "GreaterEqual_3"
  input: "gradients/mul_7_grad/tuple/control_dependency_1"
  input: "gradients/Select_3_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_3_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_3"
  input: "gradients/Select_3_grad/zeros_like"
  input: "gradients/mul_7_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_3_grad/Select"
  input: "^gradients/Select_3_grad/Select_1"
}
node {
  name: "gradients/Select_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_3_grad/Select"
  input: "^gradients/Select_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_3_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_3_grad/Select_1"
  input: "^gradients/Select_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_3_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_16_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_16_grad/Shape_1"
  op: "Shape"
  input: "Elu_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_16_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_16_grad/Shape"
  input: "gradients/mul_16_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_16_grad/mul"
  op: "Mul"
  input: "gradients/Select_8_grad/tuple/control_dependency_1"
  input: "Elu_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_16_grad/Sum"
  op: "Sum"
  input: "gradients/mul_16_grad/mul"
  input: "gradients/mul_16_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_16_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_16_grad/Sum"
  input: "gradients/mul_16_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_16_grad/mul_1"
  op: "Mul"
  input: "mul_16/x"
  input: "gradients/Select_8_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_16_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_16_grad/mul_1"
  input: "gradients/mul_16_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_16_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_16_grad/Sum_1"
  input: "gradients/mul_16_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_16_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_16_grad/Reshape"
  input: "^gradients/mul_16_grad/Reshape_1"
}
node {
  name: "gradients/mul_16_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_16_grad/Reshape"
  input: "^gradients/mul_16_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_16_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_16_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_16_grad/Reshape_1"
  input: "^gradients/mul_16_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_16_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_4_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_4_grad/Shape_1"
  op: "Shape"
  input: "Elu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_4_grad/Shape"
  input: "gradients/mul_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_4_grad/mul"
  op: "Mul"
  input: "gradients/Select_2_grad/tuple/control_dependency_1"
  input: "Elu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_4_grad/Sum"
  op: "Sum"
  input: "gradients/mul_4_grad/mul"
  input: "gradients/mul_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_4_grad/Sum"
  input: "gradients/mul_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_4_grad/mul_1"
  op: "Mul"
  input: "mul_4/x"
  input: "gradients/Select_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_4_grad/mul_1"
  input: "gradients/mul_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_4_grad/Sum_1"
  input: "gradients/mul_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_4_grad/Reshape"
  input: "^gradients/mul_4_grad/Reshape_1"
}
node {
  name: "gradients/mul_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_4_grad/Reshape"
  input: "^gradients/mul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_4_grad/Reshape_1"
  input: "^gradients/mul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_6_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_6_grad/Shape_1"
  op: "Shape"
  input: "Elu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_6_grad/Shape"
  input: "gradients/mul_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/mul"
  op: "Mul"
  input: "gradients/Select_3_grad/tuple/control_dependency_1"
  input: "Elu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_6_grad/Sum"
  op: "Sum"
  input: "gradients/mul_6_grad/mul"
  input: "gradients/mul_6_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_6_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_6_grad/Sum"
  input: "gradients/mul_6_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/mul_1"
  op: "Mul"
  input: "mul_6/x"
  input: "gradients/Select_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_6_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_6_grad/mul_1"
  input: "gradients/mul_6_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_6_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_6_grad/Sum_1"
  input: "gradients/mul_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_6_grad/Reshape"
  input: "^gradients/mul_6_grad/Reshape_1"
}
node {
  name: "gradients/mul_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_6_grad/Reshape"
  input: "^gradients/mul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_6_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_6_grad/Reshape_1"
  input: "^gradients/mul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_6_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_8_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_16_grad/tuple/control_dependency_1"
  input: "Elu_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_2_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_4_grad/tuple/control_dependency_1"
  input: "Elu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_3_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_6_grad/tuple/control_dependency_1"
  input: "Elu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_17"
  op: "AddN"
  input: "gradients/Select_8_grad/tuple/control_dependency"
  input: "gradients/Elu_8_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_8_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/Shape"
  op: "Shape"
  input: "Conv2D_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 16
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_8_grad/Shape"
  input: "gradients/add_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_17"
  input: "gradients/add_8_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_8_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_8_grad/Sum"
  input: "gradients/add_8_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_17"
  input: "gradients/add_8_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_8_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_8_grad/Sum_1"
  input: "gradients/add_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_8_grad/Reshape"
  input: "^gradients/add_8_grad/Reshape_1"
}
node {
  name: "gradients/add_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_8_grad/Reshape"
  input: "^gradients/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_8_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_8_grad/Reshape_1"
  input: "^gradients/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_8_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_18"
  op: "AddN"
  input: "gradients/Select_2_grad/tuple/control_dependency"
  input: "gradients/Elu_2_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_2_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape"
  op: "Shape"
  input: "Conv2D_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_2_grad/Shape"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_18"
  input: "gradients/add_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum"
  input: "gradients/add_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_18"
  input: "gradients/add_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum_1"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/Reshape_1"
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape_1"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_19"
  op: "AddN"
  input: "gradients/Select_3_grad/tuple/control_dependency"
  input: "gradients/Elu_3_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_3_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape"
  op: "Shape"
  input: "Conv2D_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_3_grad/Shape"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_19"
  input: "gradients/add_3_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum"
  input: "gradients/add_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_19"
  input: "gradients/add_3_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum_1"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/Reshape_1"
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape_1"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/Shape"
  op: "Shape"
  input: "MaxPool_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_8_grad/Shape"
  input: "Variable_10/read"
  input: "gradients/add_8_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_7"
  input: "gradients/Conv2D_8_grad/Shape_1"
  input: "gradients/add_8_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_8_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_8_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_8_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_8_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_8_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_8_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Shape"
  op: "Shape"
  input: "MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_2_grad/Shape"
  input: "Variable_2/read"
  input: "gradients/add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\014\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool"
  input: "gradients/Conv2D_2_grad/Shape_1"
  input: "gradients/add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_2_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_2_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_2_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_2_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_2_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_2_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Shape"
  op: "Shape"
  input: "MaxPool_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_3_grad/Shape"
  input: "Variable_2/read"
  input: "gradients/add_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\014\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_1"
  input: "gradients/Conv2D_3_grad/Shape_1"
  input: "gradients/add_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_3_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_3_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_3_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_3_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_3_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_3_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/AddN_20"
  op: "AddN"
  input: "gradients/add_2_grad/tuple/control_dependency_1"
  input: "gradients/add_3_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_7_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_15"
  input: "MaxPool_7"
  input: "gradients/Conv2D_8_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_1"
  input: "MaxPool"
  input: "gradients/Conv2D_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/MaxPool_1_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_3"
  input: "MaxPool_1"
  input: "gradients/Conv2D_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/AddN_21"
  op: "AddN"
  input: "gradients/Conv2D_2_grad/tuple/control_dependency_1"
  input: "gradients/Conv2D_3_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_2_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/mul_15_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_15_grad/Shape_1"
  op: "Shape"
  input: "Select_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_15_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_15_grad/Shape"
  input: "gradients/mul_15_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_15_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_7_grad/MaxPoolGrad"
  input: "Select_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_15_grad/Sum"
  op: "Sum"
  input: "gradients/mul_15_grad/mul"
  input: "gradients/mul_15_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_15_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_15_grad/Sum"
  input: "gradients/mul_15_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_15_grad/mul_1"
  op: "Mul"
  input: "mul_15/x"
  input: "gradients/MaxPool_7_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_15_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_15_grad/mul_1"
  input: "gradients/mul_15_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_15_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_15_grad/Sum_1"
  input: "gradients/mul_15_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_15_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_15_grad/Reshape"
  input: "^gradients/mul_15_grad/Reshape_1"
}
node {
  name: "gradients/mul_15_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_15_grad/Reshape"
  input: "^gradients/mul_15_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_15_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_15_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_15_grad/Reshape_1"
  input: "^gradients/mul_15_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_15_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/Shape_1"
  op: "Shape"
  input: "Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_1_grad/Shape"
  input: "gradients/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_grad/MaxPoolGrad"
  input: "Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/mul_1_grad/mul"
  input: "gradients/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_1_grad/Sum"
  input: "gradients/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/mul_1"
  op: "Mul"
  input: "mul_1/x"
  input: "gradients/MaxPool_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_1_grad/mul_1"
  input: "gradients/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_1_grad/Sum_1"
  input: "gradients/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_1_grad/Reshape"
  input: "^gradients/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_1_grad/Reshape"
  input: "^gradients/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_1_grad/Reshape_1"
  input: "^gradients/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_3_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_3_grad/Shape_1"
  op: "Shape"
  input: "Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_3_grad/Shape"
  input: "gradients/mul_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_3_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_1_grad/MaxPoolGrad"
  input: "Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_3_grad/Sum"
  op: "Sum"
  input: "gradients/mul_3_grad/mul"
  input: "gradients/mul_3_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_3_grad/Sum"
  input: "gradients/mul_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_3_grad/mul_1"
  op: "Mul"
  input: "mul_3/x"
  input: "gradients/MaxPool_1_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_3_grad/mul_1"
  input: "gradients/mul_3_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_3_grad/Sum_1"
  input: "gradients/mul_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_3_grad/Reshape"
  input: "^gradients/mul_3_grad/Reshape_1"
}
node {
  name: "gradients/mul_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_3_grad/Reshape"
  input: "^gradients/mul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_3_grad/Reshape_1"
  input: "^gradients/mul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_7_grad/zeros_like"
  op: "ZerosLike"
  input: "add_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_7_grad/Select"
  op: "Select"
  input: "GreaterEqual_7"
  input: "gradients/mul_15_grad/tuple/control_dependency_1"
  input: "gradients/Select_7_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_7_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_7"
  input: "gradients/Select_7_grad/zeros_like"
  input: "gradients/mul_15_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_7_grad/Select"
  input: "^gradients/Select_7_grad/Select_1"
}
node {
  name: "gradients/Select_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_7_grad/Select"
  input: "^gradients/Select_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_7_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_7_grad/Select_1"
  input: "^gradients/Select_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_7_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_grad/zeros_like"
  op: "ZerosLike"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_grad/Select"
  op: "Select"
  input: "GreaterEqual"
  input: "gradients/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/Select_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_grad/Select_1"
  op: "Select"
  input: "GreaterEqual"
  input: "gradients/Select_grad/zeros_like"
  input: "gradients/mul_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_grad/Select"
  input: "^gradients/Select_grad/Select_1"
}
node {
  name: "gradients/Select_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_grad/Select"
  input: "^gradients/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_grad/Select_1"
  input: "^gradients/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/Select_1_grad/zeros_like"
  op: "ZerosLike"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_1_grad/Select"
  op: "Select"
  input: "GreaterEqual_1"
  input: "gradients/mul_3_grad/tuple/control_dependency_1"
  input: "gradients/Select_1_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_1_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_1"
  input: "gradients/Select_1_grad/zeros_like"
  input: "gradients/mul_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_1_grad/Select"
  input: "^gradients/Select_1_grad/Select_1"
}
node {
  name: "gradients/Select_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_1_grad/Select"
  input: "^gradients/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_1_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_1_grad/Select_1"
  input: "^gradients/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_1_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_14_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_14_grad/Shape_1"
  op: "Shape"
  input: "Elu_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_14_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_14_grad/Shape"
  input: "gradients/mul_14_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_14_grad/mul"
  op: "Mul"
  input: "gradients/Select_7_grad/tuple/control_dependency_1"
  input: "Elu_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_14_grad/Sum"
  op: "Sum"
  input: "gradients/mul_14_grad/mul"
  input: "gradients/mul_14_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_14_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_14_grad/Sum"
  input: "gradients/mul_14_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_14_grad/mul_1"
  op: "Mul"
  input: "mul_14/x"
  input: "gradients/Select_7_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_14_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_14_grad/mul_1"
  input: "gradients/mul_14_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_14_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_14_grad/Sum_1"
  input: "gradients/mul_14_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_14_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_14_grad/Reshape"
  input: "^gradients/mul_14_grad/Reshape_1"
}
node {
  name: "gradients/mul_14_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_14_grad/Reshape"
  input: "^gradients/mul_14_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_14_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_14_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_14_grad/Reshape_1"
  input: "^gradients/mul_14_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_14_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_grad/Shape_1"
  op: "Shape"
  input: "Elu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_grad/Shape"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/mul"
  op: "Mul"
  input: "gradients/Select_grad/tuple/control_dependency_1"
  input: "Elu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum"
  op: "Sum"
  input: "gradients/mul_grad/mul"
  input: "gradients/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_grad/Sum"
  input: "gradients/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/mul_1"
  op: "Mul"
  input: "mul/x"
  input: "gradients/Select_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_grad/mul_1"
  input: "gradients/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_grad/Sum_1"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/Reshape_1"
}
node {
  name: "gradients/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_grad/Reshape_1"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_2_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_2_grad/Shape_1"
  op: "Shape"
  input: "Elu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_2_grad/Shape"
  input: "gradients/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/Select_1_grad/tuple/control_dependency_1"
  input: "Elu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/mul_2_grad/mul"
  input: "gradients/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_2_grad/Sum"
  input: "gradients/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_2_grad/mul_1"
  op: "Mul"
  input: "mul_2/x"
  input: "gradients/Select_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_2_grad/mul_1"
  input: "gradients/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_2_grad/Sum_1"
  input: "gradients/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_2_grad/Reshape"
  input: "^gradients/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_2_grad/Reshape"
  input: "^gradients/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_2_grad/Reshape_1"
  input: "^gradients/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_7_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_14_grad/tuple/control_dependency_1"
  input: "Elu_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_grad/tuple/control_dependency_1"
  input: "Elu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Elu_1_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_2_grad/tuple/control_dependency_1"
  input: "Elu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_22"
  op: "AddN"
  input: "gradients/Select_7_grad/tuple/control_dependency"
  input: "gradients/Elu_7_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_7_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_7_grad/Shape"
  op: "Shape"
  input: "Conv2D_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_7_grad/Shape"
  input: "gradients/add_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_22"
  input: "gradients/add_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_7_grad/Sum"
  input: "gradients/add_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_22"
  input: "gradients/add_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_7_grad/Sum_1"
  input: "gradients/add_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_7_grad/Reshape"
  input: "^gradients/add_7_grad/Reshape_1"
}
node {
  name: "gradients/add_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_7_grad/Reshape"
  input: "^gradients/add_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_7_grad/Reshape_1"
  input: "^gradients/add_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_23"
  op: "AddN"
  input: "gradients/Select_grad/tuple/control_dependency"
  input: "gradients/Elu_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_grad/Shape"
  op: "Shape"
  input: "Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_grad/Shape"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_23"
  input: "gradients/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_grad/Sum"
  input: "gradients/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_23"
  input: "gradients/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_grad/Sum_1"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_grad/Reshape"
  input: "^gradients/add_grad/Reshape_1"
}
node {
  name: "gradients/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_grad/Reshape"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_grad/Reshape_1"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_24"
  op: "AddN"
  input: "gradients/Select_1_grad/tuple/control_dependency"
  input: "gradients/Elu_1_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_1_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape"
  op: "Shape"
  input: "Conv2D_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_1_grad/Shape"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_24"
  input: "gradients/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum"
  input: "gradients/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_24"
  input: "gradients/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum_1"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/Reshape_1"
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape_1"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/Shape"
  op: "Shape"
  input: "MaxPool_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_7_grad/Shape"
  input: "Variable_8/read"
  input: "gradients/add_7_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\010\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "MaxPool_6"
  input: "gradients/Conv2D_7_grad/Shape_1"
  input: "gradients/add_7_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_7_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_7_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_7_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_7_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_7_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_7_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Shape"
  op: "Shape"
  input: "input_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_grad/Shape"
  input: "Variable/read"
  input: "gradients/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input_image"
  input: "gradients/Conv2D_grad/Shape_1"
  input: "gradients/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Shape"
  op: "Shape"
  input: "input_image_r"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_1_grad/Shape"
  input: "Variable/read"
  input: "gradients/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input_image_r"
  input: "gradients/Conv2D_1_grad/Shape_1"
  input: "gradients/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_1_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_1_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_1_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_1_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_1_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_1_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/AddN_25"
  op: "AddN"
  input: "gradients/add_grad/tuple/control_dependency_1"
  input: "gradients/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MaxPool_6_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "mul_13"
  input: "MaxPool_6"
  input: "gradients/Conv2D_7_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/AddN_26"
  op: "AddN"
  input: "gradients/Conv2D_grad/tuple/control_dependency_1"
  input: "gradients/Conv2D_1_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/mul_13_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_13_grad/Shape_1"
  op: "Shape"
  input: "Select_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_13_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_13_grad/Shape"
  input: "gradients/mul_13_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_13_grad/mul"
  op: "Mul"
  input: "gradients/MaxPool_6_grad/MaxPoolGrad"
  input: "Select_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_13_grad/Sum"
  op: "Sum"
  input: "gradients/mul_13_grad/mul"
  input: "gradients/mul_13_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_13_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_13_grad/Sum"
  input: "gradients/mul_13_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_13_grad/mul_1"
  op: "Mul"
  input: "mul_13/x"
  input: "gradients/MaxPool_6_grad/MaxPoolGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_13_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_13_grad/mul_1"
  input: "gradients/mul_13_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_13_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_13_grad/Sum_1"
  input: "gradients/mul_13_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_13_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_13_grad/Reshape"
  input: "^gradients/mul_13_grad/Reshape_1"
}
node {
  name: "gradients/mul_13_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_13_grad/Reshape"
  input: "^gradients/mul_13_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_13_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_13_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_13_grad/Reshape_1"
  input: "^gradients/mul_13_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_13_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Select_6_grad/zeros_like"
  op: "ZerosLike"
  input: "add_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_6_grad/Select"
  op: "Select"
  input: "GreaterEqual_6"
  input: "gradients/mul_13_grad/tuple/control_dependency_1"
  input: "gradients/Select_6_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_6_grad/Select_1"
  op: "Select"
  input: "GreaterEqual_6"
  input: "gradients/Select_6_grad/zeros_like"
  input: "gradients/mul_13_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Select_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Select_6_grad/Select"
  input: "^gradients/Select_6_grad/Select_1"
}
node {
  name: "gradients/Select_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Select_6_grad/Select"
  input: "^gradients/Select_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_6_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/Select_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Select_6_grad/Select_1"
  input: "^gradients/Select_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_6_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_12_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mul_12_grad/Shape_1"
  op: "Shape"
  input: "Elu_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_12_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_12_grad/Shape"
  input: "gradients/mul_12_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_12_grad/mul"
  op: "Mul"
  input: "gradients/Select_6_grad/tuple/control_dependency_1"
  input: "Elu_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_12_grad/Sum"
  op: "Sum"
  input: "gradients/mul_12_grad/mul"
  input: "gradients/mul_12_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_12_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_12_grad/Sum"
  input: "gradients/mul_12_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_12_grad/mul_1"
  op: "Mul"
  input: "mul_12/x"
  input: "gradients/Select_6_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_12_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_12_grad/mul_1"
  input: "gradients/mul_12_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_12_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_12_grad/Sum_1"
  input: "gradients/mul_12_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_12_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_12_grad/Reshape"
  input: "^gradients/mul_12_grad/Reshape_1"
}
node {
  name: "gradients/mul_12_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_12_grad/Reshape"
  input: "^gradients/mul_12_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_12_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_12_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_12_grad/Reshape_1"
  input: "^gradients/mul_12_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_12_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Elu_6_grad/EluGrad"
  op: "EluGrad"
  input: "gradients/mul_12_grad/tuple/control_dependency_1"
  input: "Elu_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_27"
  op: "AddN"
  input: "gradients/Select_6_grad/tuple/control_dependency"
  input: "gradients/Elu_6_grad/EluGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Select_6_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/Shape"
  op: "Shape"
  input: "Conv2D_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_6_grad/Shape"
  input: "gradients/add_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_27"
  input: "gradients/add_6_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_6_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_6_grad/Sum"
  input: "gradients/add_6_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_27"
  input: "gradients/add_6_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_6_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_6_grad/Sum_1"
  input: "gradients/add_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_6_grad/Reshape"
  input: "^gradients/add_6_grad/Reshape_1"
}
node {
  name: "gradients/add_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_6_grad/Reshape"
  input: "^gradients/add_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_6_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_6_grad/Reshape_1"
  input: "^gradients/add_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_6_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/Shape"
  op: "Shape"
  input: "input_image_f"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/Conv2D_6_grad/Shape"
  input: "Variable_6/read"
  input: "gradients/add_6_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input_image_f"
  input: "gradients/Conv2D_6_grad/Shape_1"
  input: "gradients/add_6_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Conv2D_6_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_6_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/Conv2D_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Conv2D_6_grad/Conv2DBackpropInput"
  input: "^gradients/Conv2D_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_6_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/Conv2D_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Conv2D_6_grad/Conv2DBackpropFilter"
  input: "^gradients/Conv2D_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Conv2D_6_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam/Assign"
  op: "Assign"
  input: "Variable/Adam"
  input: "Variable/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam/read"
  op: "Identity"
  input: "Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam_1/Assign"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "Variable/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam_1/read"
  op: "Identity"
  input: "Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable_1/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam/Assign"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam/read"
  op: "Identity"
  input: "Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Variable_1/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "Variable_1/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam_1/read"
  op: "Identity"
  input: "Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Variable_2/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adam/Assign"
  op: "Assign"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adam/read"
  op: "Identity"
  input: "Variable_2/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Variable_2/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adam_1/Assign"
  op: "Assign"
  input: "Variable_2/Adam_1"
  input: "Variable_2/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adam_1/read"
  op: "Identity"
  input: "Variable_2/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Variable_3/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adam/Assign"
  op: "Assign"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adam/read"
  op: "Identity"
  input: "Variable_3/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Variable_3/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adam_1/Assign"
  op: "Assign"
  input: "Variable_3/Adam_1"
  input: "Variable_3/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adam_1/read"
  op: "Identity"
  input: "Variable_3/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Variable_4/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 12
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 12
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adam/Assign"
  op: "Assign"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adam/read"
  op: "Identity"
  input: "Variable_4/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Variable_4/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 12
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 12
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adam_1/Assign"
  op: "Assign"
  input: "Variable_4/Adam_1"
  input: "Variable_4/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adam_1/read"
  op: "Identity"
  input: "Variable_4/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Variable_5/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Adam/Assign"
  op: "Assign"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/Adam/read"
  op: "Identity"
  input: "Variable_5/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "Variable_5/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_5/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_5/Adam_1/Assign"
  op: "Assign"
  input: "Variable_5/Adam_1"
  input: "Variable_5/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_5/Adam_1/read"
  op: "Identity"
  input: "Variable_5/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
}
node {
  name: "Variable_6/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_6/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Adam/Assign"
  op: "Assign"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/Adam/read"
  op: "Identity"
  input: "Variable_6/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Variable_6/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_6/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_6/Adam_1/Assign"
  op: "Assign"
  input: "Variable_6/Adam_1"
  input: "Variable_6/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_6/Adam_1/read"
  op: "Identity"
  input: "Variable_6/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
}
node {
  name: "Variable_7/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Adam/Assign"
  op: "Assign"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/Adam/read"
  op: "Identity"
  input: "Variable_7/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "Variable_7/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_7/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_7/Adam_1/Assign"
  op: "Assign"
  input: "Variable_7/Adam_1"
  input: "Variable_7/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_7/Adam_1/read"
  op: "Identity"
  input: "Variable_7/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
}
node {
  name: "Variable_8/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_8/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Adam/Assign"
  op: "Assign"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/Adam/read"
  op: "Identity"
  input: "Variable_8/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Variable_8/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_8/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_8/Adam_1/Assign"
  op: "Assign"
  input: "Variable_8/Adam_1"
  input: "Variable_8/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_8/Adam_1/read"
  op: "Identity"
  input: "Variable_8/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
}
node {
  name: "Variable_9/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Adam/Assign"
  op: "Assign"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/Adam/read"
  op: "Identity"
  input: "Variable_9/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "Variable_9/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_9/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_9/Adam_1/Assign"
  op: "Assign"
  input: "Variable_9/Adam_1"
  input: "Variable_9/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_9/Adam_1/read"
  op: "Identity"
  input: "Variable_9/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
}
node {
  name: "Variable_10/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_10/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Adam/Assign"
  op: "Assign"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/Adam/read"
  op: "Identity"
  input: "Variable_10/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Variable_10/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 8
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_10/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 8
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_10/Adam_1/Assign"
  op: "Assign"
  input: "Variable_10/Adam_1"
  input: "Variable_10/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_10/Adam_1/read"
  op: "Identity"
  input: "Variable_10/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
}
node {
  name: "Variable_11/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Adam/Assign"
  op: "Assign"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/Adam/read"
  op: "Identity"
  input: "Variable_11/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "Variable_11/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_11/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_11/Adam_1/Assign"
  op: "Assign"
  input: "Variable_11/Adam_1"
  input: "Variable_11/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_11/Adam_1/read"
  op: "Identity"
  input: "Variable_11/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
}
node {
  name: "Variable_12/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 16
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_12/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 16
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Adam/Assign"
  op: "Assign"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/Adam/read"
  op: "Identity"
  input: "Variable_12/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "Variable_12/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 16
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_12/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 16
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_12/Adam_1/Assign"
  op: "Assign"
  input: "Variable_12/Adam_1"
  input: "Variable_12/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_12/Adam_1/read"
  op: "Identity"
  input: "Variable_12/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
}
node {
  name: "Variable_13/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Adam/Assign"
  op: "Assign"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/Adam/read"
  op: "Identity"
  input: "Variable_13/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "Variable_13/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_13/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_13/Adam_1/Assign"
  op: "Assign"
  input: "Variable_13/Adam_1"
  input: "Variable_13/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_13/Adam_1/read"
  op: "Identity"
  input: "Variable_13/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
}
node {
  name: "Variable_14/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_14/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_14/Adam/Assign"
  op: "Assign"
  input: "Variable_14/Adam"
  input: "Variable_14/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_14/Adam/read"
  op: "Identity"
  input: "Variable_14/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
}
node {
  name: "Variable_14/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_14/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_14/Adam_1/Assign"
  op: "Assign"
  input: "Variable_14/Adam_1"
  input: "Variable_14/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_14/Adam_1/read"
  op: "Identity"
  input: "Variable_14/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
}
node {
  name: "Variable_15/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_15/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_15/Adam/Assign"
  op: "Assign"
  input: "Variable_15/Adam"
  input: "Variable_15/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_15/Adam/read"
  op: "Identity"
  input: "Variable_15/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
}
node {
  name: "Variable_15/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_15/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_15/Adam_1/Assign"
  op: "Assign"
  input: "Variable_15/Adam_1"
  input: "Variable_15/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_15/Adam_1/read"
  op: "Identity"
  input: "Variable_15/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
}
node {
  name: "Variable_16/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_16/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_16/Adam/Assign"
  op: "Assign"
  input: "Variable_16/Adam"
  input: "Variable_16/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_16/Adam/read"
  op: "Identity"
  input: "Variable_16/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
}
node {
  name: "Variable_16/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_16/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_16/Adam_1/Assign"
  op: "Assign"
  input: "Variable_16/Adam_1"
  input: "Variable_16/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_16/Adam_1/read"
  op: "Identity"
  input: "Variable_16/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
}
node {
  name: "Variable_17/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_17/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_17/Adam/Assign"
  op: "Assign"
  input: "Variable_17/Adam"
  input: "Variable_17/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_17/Adam/read"
  op: "Identity"
  input: "Variable_17/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
}
node {
  name: "Variable_17/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_17/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_17/Adam_1/Assign"
  op: "Assign"
  input: "Variable_17/Adam_1"
  input: "Variable_17/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_17/Adam_1/read"
  op: "Identity"
  input: "Variable_17/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
}
node {
  name: "Variable_18/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_18/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_18/Adam/Assign"
  op: "Assign"
  input: "Variable_18/Adam"
  input: "Variable_18/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_18/Adam/read"
  op: "Identity"
  input: "Variable_18/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
}
node {
  name: "Variable_18/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_18/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_18/Adam_1/Assign"
  op: "Assign"
  input: "Variable_18/Adam_1"
  input: "Variable_18/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_18/Adam_1/read"
  op: "Identity"
  input: "Variable_18/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
}
node {
  name: "Variable_19/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_19/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_19/Adam/Assign"
  op: "Assign"
  input: "Variable_19/Adam"
  input: "Variable_19/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_19/Adam/read"
  op: "Identity"
  input: "Variable_19/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
}
node {
  name: "Variable_19/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_19/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_19/Adam_1/Assign"
  op: "Assign"
  input: "Variable_19/Adam_1"
  input: "Variable_19/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_19/Adam_1/read"
  op: "Identity"
  input: "Variable_19/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
}
node {
  name: "Variable_20/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_20/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_20/Adam/Assign"
  op: "Assign"
  input: "Variable_20/Adam"
  input: "Variable_20/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_20/Adam/read"
  op: "Identity"
  input: "Variable_20/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
}
node {
  name: "Variable_20/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_20/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_20/Adam_1/Assign"
  op: "Assign"
  input: "Variable_20/Adam_1"
  input: "Variable_20/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_20/Adam_1/read"
  op: "Identity"
  input: "Variable_20/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
}
node {
  name: "Variable_21/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_21/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_21/Adam/Assign"
  op: "Assign"
  input: "Variable_21/Adam"
  input: "Variable_21/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_21/Adam/read"
  op: "Identity"
  input: "Variable_21/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
}
node {
  name: "Variable_21/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_21/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_21/Adam_1/Assign"
  op: "Assign"
  input: "Variable_21/Adam_1"
  input: "Variable_21/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_21/Adam_1/read"
  op: "Identity"
  input: "Variable_21/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
}
node {
  name: "Variable_22/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_22/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_22/Adam/Assign"
  op: "Assign"
  input: "Variable_22/Adam"
  input: "Variable_22/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_22/Adam/read"
  op: "Identity"
  input: "Variable_22/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
}
node {
  name: "Variable_22/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_22/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_22/Adam_1/Assign"
  op: "Assign"
  input: "Variable_22/Adam_1"
  input: "Variable_22/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_22/Adam_1/read"
  op: "Identity"
  input: "Variable_22/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
}
node {
  name: "Variable_23/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_23/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_23/Adam/Assign"
  op: "Assign"
  input: "Variable_23/Adam"
  input: "Variable_23/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_23/Adam/read"
  op: "Identity"
  input: "Variable_23/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
}
node {
  name: "Variable_23/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_23/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_23/Adam_1/Assign"
  op: "Assign"
  input: "Variable_23/Adam_1"
  input: "Variable_23/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_23/Adam_1/read"
  op: "Identity"
  input: "Variable_23/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
}
node {
  name: "Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "Adam/update_Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_2/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_2"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_3/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_3"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_4/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_4"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_5/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_5"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/AddN_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_6/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_6"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_6_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_7/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_7"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_6_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_8/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_8"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_7_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_9/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_9"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_7_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_10/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_10"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_8_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_11/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_11"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_8_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_12/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_12"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_13/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_13"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_14/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_14"
  input: "Variable_14/Adam"
  input: "Variable_14/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_10_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_15/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_15"
  input: "Variable_15/Adam"
  input: "Variable_15/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_10_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_16/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_16"
  input: "Variable_16/Adam"
  input: "Variable_16/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_17/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_17"
  input: "Variable_17/Adam"
  input: "Variable_17/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_18/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_18"
  input: "Variable_18/Adam"
  input: "Variable_18/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Conv2D_11_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_19/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_19"
  input: "Variable_19/Adam"
  input: "Variable_19/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_11_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_20/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_20"
  input: "Variable_20/Adam"
  input: "Variable_20/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_21/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_21"
  input: "Variable_21/Adam"
  input: "Variable_21/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_22/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_22"
  input: "Variable_22/Adam"
  input: "Variable_22/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_23/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_23"
  input: "Variable_23/Adam"
  input: "Variable_23/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "ExponentialDecay"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/Add_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "Adam/beta1"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  input: "^Adam/update_Variable_14/ApplyAdam"
  input: "^Adam/update_Variable_15/ApplyAdam"
  input: "^Adam/update_Variable_16/ApplyAdam"
  input: "^Adam/update_Variable_17/ApplyAdam"
  input: "^Adam/update_Variable_18/ApplyAdam"
  input: "^Adam/update_Variable_19/ApplyAdam"
  input: "^Adam/update_Variable_20/ApplyAdam"
  input: "^Adam/update_Variable_21/ApplyAdam"
  input: "^Adam/update_Variable_22/ApplyAdam"
  input: "^Adam/update_Variable_23/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Adam/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "Adam/beta2"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  input: "^Adam/update_Variable_14/ApplyAdam"
  input: "^Adam/update_Variable_15/ApplyAdam"
  input: "^Adam/update_Variable_16/ApplyAdam"
  input: "^Adam/update_Variable_17/ApplyAdam"
  input: "^Adam/update_Variable_18/ApplyAdam"
  input: "^Adam/update_Variable_19/ApplyAdam"
  input: "^Adam/update_Variable_20/ApplyAdam"
  input: "^Adam/update_Variable_21/ApplyAdam"
  input: "^Adam/update_Variable_22/ApplyAdam"
  input: "^Adam/update_Variable_23/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Adam/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/update"
  op: "NoOp"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_Variable_2/ApplyAdam"
  input: "^Adam/update_Variable_3/ApplyAdam"
  input: "^Adam/update_Variable_4/ApplyAdam"
  input: "^Adam/update_Variable_5/ApplyAdam"
  input: "^Adam/update_Variable_6/ApplyAdam"
  input: "^Adam/update_Variable_7/ApplyAdam"
  input: "^Adam/update_Variable_8/ApplyAdam"
  input: "^Adam/update_Variable_9/ApplyAdam"
  input: "^Adam/update_Variable_10/ApplyAdam"
  input: "^Adam/update_Variable_11/ApplyAdam"
  input: "^Adam/update_Variable_12/ApplyAdam"
  input: "^Adam/update_Variable_13/ApplyAdam"
  input: "^Adam/update_Variable_14/ApplyAdam"
  input: "^Adam/update_Variable_15/ApplyAdam"
  input: "^Adam/update_Variable_16/ApplyAdam"
  input: "^Adam/update_Variable_17/ApplyAdam"
  input: "^Adam/update_Variable_18/ApplyAdam"
  input: "^Adam/update_Variable_19/ApplyAdam"
  input: "^Adam/update_Variable_20/ApplyAdam"
  input: "^Adam/update_Variable_21/ApplyAdam"
  input: "^Adam/update_Variable_22/ApplyAdam"
  input: "^Adam/update_Variable_23/ApplyAdam"
  input: "^Adam/Assign"
  input: "^Adam/Assign_1"
}
node {
  name: "Adam/value"
  op: "Const"
  input: "^Adam/update"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_24"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adam"
  op: "AssignAdd"
  input: "Variable_24"
  input: "Adam/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_24"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 75
          }
        }
        string_val: "Variable"
        string_val: "Variable/Adam"
        string_val: "Variable/Adam_1"
        string_val: "Variable_1"
        string_val: "Variable_1/Adam"
        string_val: "Variable_1/Adam_1"
        string_val: "Variable_10"
        string_val: "Variable_10/Adam"
        string_val: "Variable_10/Adam_1"
        string_val: "Variable_11"
        string_val: "Variable_11/Adam"
        string_val: "Variable_11/Adam_1"
        string_val: "Variable_12"
        string_val: "Variable_12/Adam"
        string_val: "Variable_12/Adam_1"
        string_val: "Variable_13"
        string_val: "Variable_13/Adam"
        string_val: "Variable_13/Adam_1"
        string_val: "Variable_14"
        string_val: "Variable_14/Adam"
        string_val: "Variable_14/Adam_1"
        string_val: "Variable_15"
        string_val: "Variable_15/Adam"
        string_val: "Variable_15/Adam_1"
        string_val: "Variable_16"
        string_val: "Variable_16/Adam"
        string_val: "Variable_16/Adam_1"
        string_val: "Variable_17"
        string_val: "Variable_17/Adam"
        string_val: "Variable_17/Adam_1"
        string_val: "Variable_18"
        string_val: "Variable_18/Adam"
        string_val: "Variable_18/Adam_1"
        string_val: "Variable_19"
        string_val: "Variable_19/Adam"
        string_val: "Variable_19/Adam_1"
        string_val: "Variable_2"
        string_val: "Variable_2/Adam"
        string_val: "Variable_2/Adam_1"
        string_val: "Variable_20"
        string_val: "Variable_20/Adam"
        string_val: "Variable_20/Adam_1"
        string_val: "Variable_21"
        string_val: "Variable_21/Adam"
        string_val: "Variable_21/Adam_1"
        string_val: "Variable_22"
        string_val: "Variable_22/Adam"
        string_val: "Variable_22/Adam_1"
        string_val: "Variable_23"
        string_val: "Variable_23/Adam"
        string_val: "Variable_23/Adam_1"
        string_val: "Variable_24"
        string_val: "Variable_3"
        string_val: "Variable_3/Adam"
        string_val: "Variable_3/Adam_1"
        string_val: "Variable_4"
        string_val: "Variable_4/Adam"
        string_val: "Variable_4/Adam_1"
        string_val: "Variable_5"
        string_val: "Variable_5/Adam"
        string_val: "Variable_5/Adam_1"
        string_val: "Variable_6"
        string_val: "Variable_6/Adam"
        string_val: "Variable_6/Adam_1"
        string_val: "Variable_7"
        string_val: "Variable_7/Adam"
        string_val: "Variable_7/Adam_1"
        string_val: "Variable_8"
        string_val: "Variable_8/Adam"
        string_val: "Variable_8/Adam_1"
        string_val: "Variable_9"
        string_val: "Variable_9/Adam"
        string_val: "Variable_9/Adam_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 75
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "Variable_10"
  input: "Variable_10/Adam"
  input: "Variable_10/Adam_1"
  input: "Variable_11"
  input: "Variable_11/Adam"
  input: "Variable_11/Adam_1"
  input: "Variable_12"
  input: "Variable_12/Adam"
  input: "Variable_12/Adam_1"
  input: "Variable_13"
  input: "Variable_13/Adam"
  input: "Variable_13/Adam_1"
  input: "Variable_14"
  input: "Variable_14/Adam"
  input: "Variable_14/Adam_1"
  input: "Variable_15"
  input: "Variable_15/Adam"
  input: "Variable_15/Adam_1"
  input: "Variable_16"
  input: "Variable_16/Adam"
  input: "Variable_16/Adam_1"
  input: "Variable_17"
  input: "Variable_17/Adam"
  input: "Variable_17/Adam_1"
  input: "Variable_18"
  input: "Variable_18/Adam"
  input: "Variable_18/Adam_1"
  input: "Variable_19"
  input: "Variable_19/Adam"
  input: "Variable_19/Adam_1"
  input: "Variable_2"
  input: "Variable_2/Adam"
  input: "Variable_2/Adam_1"
  input: "Variable_20"
  input: "Variable_20/Adam"
  input: "Variable_20/Adam_1"
  input: "Variable_21"
  input: "Variable_21/Adam"
  input: "Variable_21/Adam_1"
  input: "Variable_22"
  input: "Variable_22/Adam"
  input: "Variable_22/Adam_1"
  input: "Variable_23"
  input: "Variable_23/Adam"
  input: "Variable_23/Adam_1"
  input: "Variable_24"
  input: "Variable_3"
  input: "Variable_3/Adam"
  input: "Variable_3/Adam_1"
  input: "Variable_4"
  input: "Variable_4/Adam"
  input: "Variable_4/Adam_1"
  input: "Variable_5"
  input: "Variable_5/Adam"
  input: "Variable_5/Adam_1"
  input: "Variable_6"
  input: "Variable_6/Adam"
  input: "Variable_6/Adam_1"
  input: "Variable_7"
  input: "Variable_7/Adam"
  input: "Variable_7/Adam_1"
  input: "Variable_8"
  input: "Variable_8/Adam"
  input: "Variable_8/Adam_1"
  input: "Variable_9"
  input: "Variable_9/Adam"
  input: "Variable_9/Adam_1"
  input: "beta1_power"
  input: "beta2_power"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Variable"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "Variable/Adam"
  input: "save/RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "save/RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "Variable_1"
  input: "save/RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "Variable_10"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "Variable_10/Adam"
  input: "save/RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_10/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "Variable_10/Adam_1"
  input: "save/RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "Variable_11"
  input: "save/RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "Variable_11/Adam"
  input: "save/RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_11/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "Variable_11/Adam_1"
  input: "save/RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "Variable_12"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "Variable_12/Adam"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_12/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "Variable_12/Adam_1"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "Variable_13"
  input: "save/RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "Variable_13/Adam"
  input: "save/RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_13/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "Variable_13/Adam_1"
  input: "save/RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_14"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "Variable_14"
  input: "save/RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_19/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_14/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_19/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_19"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_19/tensor_names"
  input: "save/RestoreV2_19/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "Variable_14/Adam"
  input: "save/RestoreV2_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_20/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_14/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_20/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_20"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_20/tensor_names"
  input: "save/RestoreV2_20/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "Variable_14/Adam_1"
  input: "save/RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_21/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_15"
      }
    }
  }
}
node {
  name: "save/RestoreV2_21/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_21"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_21/tensor_names"
  input: "save/RestoreV2_21/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "Variable_15"
  input: "save/RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_22/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_15/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_22/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_22"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_22/tensor_names"
  input: "save/RestoreV2_22/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "Variable_15/Adam"
  input: "save/RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_23/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_15/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_23/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_23"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_23/tensor_names"
  input: "save/RestoreV2_23/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "Variable_15/Adam_1"
  input: "save/RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_24/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_16"
      }
    }
  }
}
node {
  name: "save/RestoreV2_24/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_24"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_24/tensor_names"
  input: "save/RestoreV2_24/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "Variable_16"
  input: "save/RestoreV2_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_25/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_16/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_25/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_25"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_25/tensor_names"
  input: "save/RestoreV2_25/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "Variable_16/Adam"
  input: "save/RestoreV2_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_26/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_16/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_26/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_26"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_26/tensor_names"
  input: "save/RestoreV2_26/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "Variable_16/Adam_1"
  input: "save/RestoreV2_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_16"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_27/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_17"
      }
    }
  }
}
node {
  name: "save/RestoreV2_27/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_27"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_27/tensor_names"
  input: "save/RestoreV2_27/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "Variable_17"
  input: "save/RestoreV2_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_28/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_17/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_28/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_28"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_28/tensor_names"
  input: "save/RestoreV2_28/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "Variable_17/Adam"
  input: "save/RestoreV2_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_29/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_17/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_29/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_29"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_29/tensor_names"
  input: "save/RestoreV2_29/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "Variable_17/Adam_1"
  input: "save/RestoreV2_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_17"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_30/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_18"
      }
    }
  }
}
node {
  name: "save/RestoreV2_30/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_30"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_30/tensor_names"
  input: "save/RestoreV2_30/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "Variable_18"
  input: "save/RestoreV2_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_31/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_18/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_31/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_31"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_31/tensor_names"
  input: "save/RestoreV2_31/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "Variable_18/Adam"
  input: "save/RestoreV2_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_32/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_18/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_32/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_32"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_32/tensor_names"
  input: "save/RestoreV2_32/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "Variable_18/Adam_1"
  input: "save/RestoreV2_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_18"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_33/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_19"
      }
    }
  }
}
node {
  name: "save/RestoreV2_33/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_33"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_33/tensor_names"
  input: "save/RestoreV2_33/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "Variable_19"
  input: "save/RestoreV2_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_34/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_19/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_34/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_34"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_34/tensor_names"
  input: "save/RestoreV2_34/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "Variable_19/Adam"
  input: "save/RestoreV2_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_35/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_19/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_35/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_35"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_35/tensor_names"
  input: "save/RestoreV2_35/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "Variable_19/Adam_1"
  input: "save/RestoreV2_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_19"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_36/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2"
      }
    }
  }
}
node {
  name: "save/RestoreV2_36/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_36"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_36/tensor_names"
  input: "save/RestoreV2_36/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "Variable_2"
  input: "save/RestoreV2_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_37/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_37/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_37"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_37/tensor_names"
  input: "save/RestoreV2_37/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "Variable_2/Adam"
  input: "save/RestoreV2_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_38/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_2/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_38/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_38"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_38/tensor_names"
  input: "save/RestoreV2_38/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "Variable_2/Adam_1"
  input: "save/RestoreV2_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_39/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_20"
      }
    }
  }
}
node {
  name: "save/RestoreV2_39/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_39"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_39/tensor_names"
  input: "save/RestoreV2_39/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "Variable_20"
  input: "save/RestoreV2_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_40/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_20/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_40/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_40"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_40/tensor_names"
  input: "save/RestoreV2_40/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "Variable_20/Adam"
  input: "save/RestoreV2_40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_41/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_20/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_41/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_41"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_41/tensor_names"
  input: "save/RestoreV2_41/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "Variable_20/Adam_1"
  input: "save/RestoreV2_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_20"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_42/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_21"
      }
    }
  }
}
node {
  name: "save/RestoreV2_42/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_42"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_42/tensor_names"
  input: "save/RestoreV2_42/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "Variable_21"
  input: "save/RestoreV2_42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_43/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_21/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_43/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_43"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_43/tensor_names"
  input: "save/RestoreV2_43/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "Variable_21/Adam"
  input: "save/RestoreV2_43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_44/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_21/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_44/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_44"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_44/tensor_names"
  input: "save/RestoreV2_44/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "Variable_21/Adam_1"
  input: "save/RestoreV2_44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_21"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_45/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_22"
      }
    }
  }
}
node {
  name: "save/RestoreV2_45/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_45"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_45/tensor_names"
  input: "save/RestoreV2_45/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "Variable_22"
  input: "save/RestoreV2_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_46/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_22/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_46/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_46"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_46/tensor_names"
  input: "save/RestoreV2_46/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "Variable_22/Adam"
  input: "save/RestoreV2_46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_47/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_22/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_47/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_47"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_47/tensor_names"
  input: "save/RestoreV2_47/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "Variable_22/Adam_1"
  input: "save/RestoreV2_47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_22"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_48/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_23"
      }
    }
  }
}
node {
  name: "save/RestoreV2_48/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_48"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_48/tensor_names"
  input: "save/RestoreV2_48/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "Variable_23"
  input: "save/RestoreV2_48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_49/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_23/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_49/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_49"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_49/tensor_names"
  input: "save/RestoreV2_49/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "Variable_23/Adam"
  input: "save/RestoreV2_49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_50/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_23/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_50/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_50"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_50/tensor_names"
  input: "save/RestoreV2_50/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_50"
  op: "Assign"
  input: "Variable_23/Adam_1"
  input: "save/RestoreV2_50"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_23"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_51/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_24"
      }
    }
  }
}
node {
  name: "save/RestoreV2_51/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_51"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_51/tensor_names"
  input: "save/RestoreV2_51/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/Assign_51"
  op: "Assign"
  input: "Variable_24"
  input: "save/RestoreV2_51"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_24"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_52/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3"
      }
    }
  }
}
node {
  name: "save/RestoreV2_52/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_52"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_52/tensor_names"
  input: "save/RestoreV2_52/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_52"
  op: "Assign"
  input: "Variable_3"
  input: "save/RestoreV2_52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_53/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_53/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_53"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_53/tensor_names"
  input: "save/RestoreV2_53/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_53"
  op: "Assign"
  input: "Variable_3/Adam"
  input: "save/RestoreV2_53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_54/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_3/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_54/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_54"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_54/tensor_names"
  input: "save/RestoreV2_54/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_54"
  op: "Assign"
  input: "Variable_3/Adam_1"
  input: "save/RestoreV2_54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_55/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4"
      }
    }
  }
}
node {
  name: "save/RestoreV2_55/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_55"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_55/tensor_names"
  input: "save/RestoreV2_55/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_55"
  op: "Assign"
  input: "Variable_4"
  input: "save/RestoreV2_55"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_56/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_56/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_56"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_56/tensor_names"
  input: "save/RestoreV2_56/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_56"
  op: "Assign"
  input: "Variable_4/Adam"
  input: "save/RestoreV2_56"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_57/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_4/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_57/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_57"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_57/tensor_names"
  input: "save/RestoreV2_57/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_57"
  op: "Assign"
  input: "Variable_4/Adam_1"
  input: "save/RestoreV2_57"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_58/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5"
      }
    }
  }
}
node {
  name: "save/RestoreV2_58/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_58"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_58/tensor_names"
  input: "save/RestoreV2_58/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_58"
  op: "Assign"
  input: "Variable_5"
  input: "save/RestoreV2_58"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_59/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_59/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_59"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_59/tensor_names"
  input: "save/RestoreV2_59/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_59"
  op: "Assign"
  input: "Variable_5/Adam"
  input: "save/RestoreV2_59"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_60/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_5/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_60/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_60"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_60/tensor_names"
  input: "save/RestoreV2_60/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_60"
  op: "Assign"
  input: "Variable_5/Adam_1"
  input: "save/RestoreV2_60"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_61/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6"
      }
    }
  }
}
node {
  name: "save/RestoreV2_61/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_61"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_61/tensor_names"
  input: "save/RestoreV2_61/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_61"
  op: "Assign"
  input: "Variable_6"
  input: "save/RestoreV2_61"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_62/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_62/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_62"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_62/tensor_names"
  input: "save/RestoreV2_62/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_62"
  op: "Assign"
  input: "Variable_6/Adam"
  input: "save/RestoreV2_62"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_63/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_6/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_63/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_63"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_63/tensor_names"
  input: "save/RestoreV2_63/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_63"
  op: "Assign"
  input: "Variable_6/Adam_1"
  input: "save/RestoreV2_63"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_64/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7"
      }
    }
  }
}
node {
  name: "save/RestoreV2_64/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_64"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_64/tensor_names"
  input: "save/RestoreV2_64/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_64"
  op: "Assign"
  input: "Variable_7"
  input: "save/RestoreV2_64"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_65/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_65/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_65"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_65/tensor_names"
  input: "save/RestoreV2_65/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_65"
  op: "Assign"
  input: "Variable_7/Adam"
  input: "save/RestoreV2_65"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_66/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_7/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_66/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_66"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_66/tensor_names"
  input: "save/RestoreV2_66/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_66"
  op: "Assign"
  input: "Variable_7/Adam_1"
  input: "save/RestoreV2_66"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_67/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8"
      }
    }
  }
}
node {
  name: "save/RestoreV2_67/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_67"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_67/tensor_names"
  input: "save/RestoreV2_67/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_67"
  op: "Assign"
  input: "Variable_8"
  input: "save/RestoreV2_67"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_68/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_68/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_68"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_68/tensor_names"
  input: "save/RestoreV2_68/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_68"
  op: "Assign"
  input: "Variable_8/Adam"
  input: "save/RestoreV2_68"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_69/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_8/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_69/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_69"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_69/tensor_names"
  input: "save/RestoreV2_69/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_69"
  op: "Assign"
  input: "Variable_8/Adam_1"
  input: "save/RestoreV2_69"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_70/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9"
      }
    }
  }
}
node {
  name: "save/RestoreV2_70/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_70"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_70/tensor_names"
  input: "save/RestoreV2_70/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_70"
  op: "Assign"
  input: "Variable_9"
  input: "save/RestoreV2_70"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_71/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_71/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_71"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_71/tensor_names"
  input: "save/RestoreV2_71/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_71"
  op: "Assign"
  input: "Variable_9/Adam"
  input: "save/RestoreV2_71"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_72/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable_9/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_72/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_72"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_72/tensor_names"
  input: "save/RestoreV2_72/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_72"
  op: "Assign"
  input: "Variable_9/Adam_1"
  input: "save/RestoreV2_72"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_73/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta1_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_73/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_73"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_73/tensor_names"
  input: "save/RestoreV2_73/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_73"
  op: "Assign"
  input: "beta1_power"
  input: "save/RestoreV2_73"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_74/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_74/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_74"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_74/tensor_names"
  input: "save/RestoreV2_74/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_74"
  op: "Assign"
  input: "beta2_power"
  input: "save/RestoreV2_74"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
  input: "^save/Assign_50"
  input: "^save/Assign_51"
  input: "^save/Assign_52"
  input: "^save/Assign_53"
  input: "^save/Assign_54"
  input: "^save/Assign_55"
  input: "^save/Assign_56"
  input: "^save/Assign_57"
  input: "^save/Assign_58"
  input: "^save/Assign_59"
  input: "^save/Assign_60"
  input: "^save/Assign_61"
  input: "^save/Assign_62"
  input: "^save/Assign_63"
  input: "^save/Assign_64"
  input: "^save/Assign_65"
  input: "^save/Assign_66"
  input: "^save/Assign_67"
  input: "^save/Assign_68"
  input: "^save/Assign_69"
  input: "^save/Assign_70"
  input: "^save/Assign_71"
  input: "^save/Assign_72"
  input: "^save/Assign_73"
  input: "^save/Assign_74"
}
node {
  name: "init"
  op: "NoOp"
  input: "^Variable/Assign"
  input: "^Variable_1/Assign"
  input: "^Variable_2/Assign"
  input: "^Variable_3/Assign"
  input: "^Variable_4/Assign"
  input: "^Variable_5/Assign"
  input: "^Variable_6/Assign"
  input: "^Variable_7/Assign"
  input: "^Variable_8/Assign"
  input: "^Variable_9/Assign"
  input: "^Variable_10/Assign"
  input: "^Variable_11/Assign"
  input: "^Variable_12/Assign"
  input: "^Variable_13/Assign"
  input: "^Variable_14/Assign"
  input: "^Variable_15/Assign"
  input: "^Variable_16/Assign"
  input: "^Variable_17/Assign"
  input: "^Variable_18/Assign"
  input: "^Variable_19/Assign"
  input: "^Variable_20/Assign"
  input: "^Variable_21/Assign"
  input: "^Variable_22/Assign"
  input: "^Variable_23/Assign"
  input: "^Variable_24/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
  input: "^Variable/Adam/Assign"
  input: "^Variable/Adam_1/Assign"
  input: "^Variable_1/Adam/Assign"
  input: "^Variable_1/Adam_1/Assign"
  input: "^Variable_2/Adam/Assign"
  input: "^Variable_2/Adam_1/Assign"
  input: "^Variable_3/Adam/Assign"
  input: "^Variable_3/Adam_1/Assign"
  input: "^Variable_4/Adam/Assign"
  input: "^Variable_4/Adam_1/Assign"
  input: "^Variable_5/Adam/Assign"
  input: "^Variable_5/Adam_1/Assign"
  input: "^Variable_6/Adam/Assign"
  input: "^Variable_6/Adam_1/Assign"
  input: "^Variable_7/Adam/Assign"
  input: "^Variable_7/Adam_1/Assign"
  input: "^Variable_8/Adam/Assign"
  input: "^Variable_8/Adam_1/Assign"
  input: "^Variable_9/Adam/Assign"
  input: "^Variable_9/Adam_1/Assign"
  input: "^Variable_10/Adam/Assign"
  input: "^Variable_10/Adam_1/Assign"
  input: "^Variable_11/Adam/Assign"
  input: "^Variable_11/Adam_1/Assign"
  input: "^Variable_12/Adam/Assign"
  input: "^Variable_12/Adam_1/Assign"
  input: "^Variable_13/Adam/Assign"
  input: "^Variable_13/Adam_1/Assign"
  input: "^Variable_14/Adam/Assign"
  input: "^Variable_14/Adam_1/Assign"
  input: "^Variable_15/Adam/Assign"
  input: "^Variable_15/Adam_1/Assign"
  input: "^Variable_16/Adam/Assign"
  input: "^Variable_16/Adam_1/Assign"
  input: "^Variable_17/Adam/Assign"
  input: "^Variable_17/Adam_1/Assign"
  input: "^Variable_18/Adam/Assign"
  input: "^Variable_18/Adam_1/Assign"
  input: "^Variable_19/Adam/Assign"
  input: "^Variable_19/Adam_1/Assign"
  input: "^Variable_20/Adam/Assign"
  input: "^Variable_20/Adam_1/Assign"
  input: "^Variable_21/Adam/Assign"
  input: "^Variable_21/Adam_1/Assign"
  input: "^Variable_22/Adam/Assign"
  input: "^Variable_22/Adam_1/Assign"
  input: "^Variable_23/Adam/Assign"
  input: "^Variable_23/Adam_1/Assign"
}
versions {
  producer: 22
}