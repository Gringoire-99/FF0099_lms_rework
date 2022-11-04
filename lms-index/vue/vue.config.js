const {defineConfig} = require('@vue/cli-service')

module.exports = defineConfig({
    transpileDependencies: true,
    lintOnSave: false,
    devServer: {
        port: 8081,
        proxy: {
            //带有/apit标签的请求向目的主机发生请求
            '^/api': {
                target: 'http://localhost:88/',
                //将/api/替换为空字符串
                pathRewrite: {'/api': '/admin/lmsmain'}
            }
        }
    },

    configureWebpack: {
        resolve: {extensions: [".ts", ".tsx", ".js", ".json"]},
        module: {
            rules: [
                {
                    test: /\.tsx?$/,
                    loader: 'ts-loader',
                    exclude: /node_modules/,
                    options: {
                        appendTsSuffixTo: [/\.vue$/],
                    }
                }
            ]
        },
        
    },

})
