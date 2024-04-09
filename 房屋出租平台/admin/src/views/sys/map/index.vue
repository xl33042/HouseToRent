<template>
  <div class="app-container">
    <baidu-map class="bm-view" :center="center" :zoom="zoom" @ready="initMap">
      <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT" />
      <!-- <bm-scale anchor="BMAP_ANCHOR_TOP_RIGHT" /> -->
      <!-- <bm-overview-map anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :is-open="true" /> -->
      <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :show-address-bar="true" :auto-location="true" />
      <bm-city-list anchor="BMAP_ANCHOR_TOP_LEFT" />
      <!-- <bm-boundary name="赣州市" :stroke-weight="2" stroke-color="blue" /> -->
      <bm-panorama />
      <bm-marker
        v-for="(item, index) in mapData"
        :key="index"
        :position="{lng: item.lng, lat: item.lat}"
        :clicking="false"
        animation="BMAP_ANIMATION_BOUNCE"
      >
        <bm-label :content="item.communityName" :label-style="{color: 'red', fontSize : '9px'}" :offset="{width: -25, height: 20}" />
      </bm-marker>
    </baidu-map>
  </div>
</template>

<script>
export default {
  name: 'Map',
  data() {
    return {
      listQuery: {
        gradeId: ''
      },
      center: {
        lng: 114.93896,
        lat: 25.835488
      },
      zoom: 14,
      mapData: [],
      gradeList: []
    }
  },
  mounted() {
  },
  methods: {
    initMap({ BMap, map }) {
      this.center.lng = 114.93896
      this.center.lat = 25.835488
      this.zoom = 14
      map.enableScrollWheelZoom()
      map.enableKeyboard()
      map.enableDragging()
      map.enableDoubleClickZoom()
      getCommunityMap().then(res => {
        this.mapData = res.data
      })
    },
    initData() {
      // getCommunityMap().then(res => {
      //   this.mapData = res.data
      // })
    }
  }
}
</script>

<style lang="scss" scoped>
  .bm-view {
    width: 100%;
    height: 500px;
  }
</style>
