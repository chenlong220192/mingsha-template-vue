<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :span="10">
        <el-card shadow="hover" style="width: 100%;">
          <div slot="header" class="clearfix">
            <span>文嘉《明日歌》</span>
            <el-button
              style="float: right; padding: 3px 0"
              type="text"
              @click="clickFn"
              >暂停</el-button
            >
          </div>
          <div style="font-size: 18px;text-align: center; margin-top: 35px;">
            明日复明日
          </div>
          <div style="font-size: 18px;text-align: center;">明日何其多</div>
          <div style="font-size: 18px;text-align: center;">我生待明日</div>
          <div style="font-size: 18px;text-align: center;">万事成蹉跎</div>
          <div style="margin-top: 35px;"></div>
          <el-statistic
            ref="statistic"
            @finish="hilarity"
            format="HH:mm:ss"
            :value="deadline"
            title="距离明日："
            time-indices >
          </el-statistic>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "1.0.0",
      deadline: Date.now() + (new Date().setHours(23, 59, 59) - Date.now()),
      stop: true,
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    hilarity() {
      this.$notify({
        title: "提示",
        message: "时间已到"
      });
    },
    clickFn() {
      this.$refs.statistic.suspend(this.stop);
      this.stop = !this.stop;
    },
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>
