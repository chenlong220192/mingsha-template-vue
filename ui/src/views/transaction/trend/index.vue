<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="币种" prop="coin">
        <el-select v-model="queryParams.coin" placeholder="请选择币种" clearable>
          <el-option
            v-for="dict in dict.type.transaction_coin"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="档位" prop="gear">
        <el-select v-model="queryParams.gear" placeholder="请选择档位" clearable>
          <el-option
            v-for="dict in dict.type.transaction_gear"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="日期">
        <el-date-picker
          v-model="daterangeDate"
          style="width: 240px"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="涨跌方向" prop="direction">
        <el-select v-model="queryParams.direction" placeholder="请选择涨跌方向" clearable>
          <el-option
            v-for="dict in dict.type.transaction_direction"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['transaction:trend:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['transaction:trend:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['transaction:trend:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['transaction:trend:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table ref="tables" v-loading="loading" :data="trendList" @selection-change="handleSelectionChange" :default-sort="defaultSort" @sort-change="handleSortChange" :row-class-name="tableRowClassName">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" v-if="false" />
      <el-table-column label="币种" align="center" prop="coin" fixed >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.transaction_coin" :value="scope.row.coin"/>
        </template>
      </el-table-column>
      <el-table-column label="档位" align="center" prop="gear">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.transaction_gear" :value="scope.row.gear"/>
        </template>
      </el-table-column>
      <el-table-column label="日期" align="center" prop="date" width="180" :show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']" >
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ parseTime(scope.row.date, '{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="开盘价" align="center" prop="priceStart" />
      <el-table-column label="收盘价" align="center" prop="priceEnd" />
      <el-table-column label="最高价" align="center" prop="priceHighest" />
      <el-table-column label="最低价" align="center" prop="priceLowest" />
      <el-table-column label="关键点" align="center" prop="pricePoints" />
      <el-table-column label="涨跌方向" align="center" prop="direction":show-overflow-tooltip="true" sortable="custom" :sort-orders="['descending', 'ascending']"  >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.transaction_direction" :value="scope.row.direction"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['transaction:trend:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['transaction:trend:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改交易趋势对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="币种" prop="coin">
          <el-select v-model="form.coin" placeholder="请选择币种">
            <el-option
              v-for="dict in dict.type.transaction_coin"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="档位" prop="gear">
          <el-select v-model="form.gear" placeholder="请选择档位">
            <el-option
              v-for="dict in dict.type.transaction_gear"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="日期" prop="date">
          <el-date-picker clearable
            v-model="form.date"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择日期"
            default-time="08:00:00">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="开盘价" prop="priceStart">
          <el-input v-model="form.priceStart" placeholder="请输入开盘价" />
        </el-form-item>
        <el-form-item label="收盘价" prop="priceEnd">
          <el-input v-model="form.priceEnd" placeholder="请输入收盘价" />
        </el-form-item>
        <el-form-item label="最高价" prop="priceHighest">
          <el-input v-model="form.priceHighest" placeholder="请输入最高价" />
        </el-form-item>
        <el-form-item label="最低价" prop="priceLowest">
          <el-input v-model="form.priceLowest" placeholder="请输入最低价" />
        </el-form-item>
        <el-form-item label="关键点" prop="pricePoints">
          <el-input v-model="form.pricePoints" placeholder="请输入关键点" />
        </el-form-item>
        <el-form-item label="涨跌方向" prop="direction">
          <el-radio-group v-model="form.direction">
            <el-radio
              v-for="dict in dict.type.transaction_direction"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style>
  .el-table .KONG-row {
    background: #67C23A;
  }

  .el-table .DUO-row {
    background: #F56C6C;
  }
</style>

<script>
import { listTrend, getTrend, delTrend, addTrend, updateTrend } from "@/api/transaction/trend";

export default {
  name: "Trend",
  dicts: ['transaction_coin', 'transaction_direction', 'transaction_gear'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 交易趋势表格数据
      trendList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 备注时间范围
      daterangeDate: [],
      // 默认排序
      defaultSort: {prop: 'date', order: 'descending'},
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        coin: null,
        gear: null,
        date: null,
        direction: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        coin: [
          { required: true, message: "币种不能为空", trigger: "change" }
        ],
        gear: [
          { required: true, message: "档位不能为空", trigger: "change" }
        ],
        date: [
          { required: true, message: "日期不能为空", trigger: "blur" }
        ],
        priceStart: [
          { required: true, message: "开盘价不能为空", trigger: "blur" }
        ],
        priceEnd: [
          { required: true, message: "收盘价不能为空", trigger: "blur" }
        ],
        priceHighest: [
          { required: true, message: "最高价不能为空", trigger: "blur" }
        ],
        priceLowest: [
          { required: true, message: "最低价不能为空", trigger: "blur" }
        ],
        pricePoints: [
          { required: true, message: "关键点不能为空", trigger: "blur" }
        ],
        direction: [
          { required: true, message: "涨跌方向不能为空", trigger: "change" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询交易趋势列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeDate && '' != this.daterangeDate) {
        this.queryParams.params["beginDate"] = this.daterangeDate[0];
        this.queryParams.params["endDate"] = this.daterangeDate[1];
      }
      listTrend(this.queryParams).then(response => {
        this.trendList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        coin: null,
        gear: null,
        date: null,
        priceStart: null,
        priceEnd: null,
        priceHighest: null,
        priceLowest: null,
        pricePoints: null,
        direction: null,
        createTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeDate = [];
      this.resetForm("queryForm");
      this.handleQuery();
      this.$refs.tables.sort(this.defaultSort.prop, this.defaultSort.order)
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加交易趋势";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTrend(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改交易趋势";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTrend(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTrend(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除交易趋势编号为"' + ids + '"的数据项？').then(function() {
        return delTrend(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('transaction/trend/export', {
        ...this.queryParams
      }, `trend_${new Date().getTime()}.xlsx`)
    },
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getList();
    },
    /**  */
    tableRowClassName({row, rowIndex}) {
      if (row.direction === 'DUO') {
        return 'DUO-row';
      } else if (row.direction === 'KONG') {
        return 'KONG-row';
      }
      return '';
    }
  }
};
</script>
