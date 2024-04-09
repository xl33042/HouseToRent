<template>
  <div class="app-container">
    <div>
      <v-chart :options="options" style="width: 100%;height:500px;" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'Dashboard',
  data() {
    return {
      listQuery: {
        years: '2021'
      },
      options: {
        title: {
          text: '小区居民分类统计表',
          subtext: '单位：人'
        },
        tooltip: {},
        legend: {},
        dataset: {
          // 提供一份数据。
          source: []
        },
        xAxis: {
          type: 'category'
        },
        yAxis: {},
        series: []
      }
    }
  },
  created() {
    // chart().then(res => {
      // this.options = res.data
      // this.options = JSON.parse(res.data)
      // this.options = JSON.stringify(res.data)
    //   console.log(res.data)
    //   this.options.title = res.data.options.title
    //   this.options.dataset = res.data.options.dataset
    //   this.options.series = res.data.options.series
    //   this.options.legend = res.data.options.legend
    //   this.options.tooltip = res.data.options.tooltip
    //   this.options.xAxis = res.data.options.xAxis
    //   this.options.yAxis = res.data.options.yAxis
    // })
  },
  methods: {
  }
}
</script>

<style lang="scss" scoped>

</style>
