<template>
    <view>
        <u-cell-group>
            <u-cell :titleStyle="{fontWeight: 500}" @click="openFileInput" title="个人头像" :value="imagePath"
                isLink></u-cell>
            <u-cell title="姓名" value="内容" :isLink="true" @click="goToUsernamePage"></u-cell>
        </u-cell-group>
        <u-cell title="更多信息" :isLink="true" @click="goToMoreInformationPage"></u-cell>
    </view>
</template>

<script>
export default {
    data() {
        return {
            imagePath: '', // 根据你的实际需求填充
            rules: {} // 添加空对象作为初始值
        };
    },

    methods: {
        openFileInput() {
            // 处理打开文件选择对话框的逻辑
        },
        goToUsernamePage() {
            // 跳转到 username 页面
            uni.navigateTo({
                url: '/pages/username/username'
            });
        },
        goToMoreInformationPage() {
            // 跳转到 More information 页面
            uni.navigateTo({
                url: '/pages/moreinformation/moreinformation'
            });
        }
    },
};
</script>

<style lang="scss">
.cell-page {
    padding-bottom: 20px;
}

.u-page {
    padding: 0;

    &__item {

        &__title {
            color: $u-tips-color;
            background-color: $u-bg-color;
            padding: 15px;
            font-size: 15px;

            &__slot-title {
                color: $u-primary;
                font-size: 14px;
            }
        }
    }
}
</style>
