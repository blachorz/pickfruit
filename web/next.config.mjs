/** @type {import('next').NextConfig} */
const nextConfig = {
    typescript: {
        // !! 警告 !!
        // 允許生產環境編譯即使專案有型別錯誤。
        // 這在快速部署 MVP 時非常有用。
        ignoreBuildErrors: true,
    },
    eslint: {
        // 在生產環境編譯時忽略 ESLint 錯誤。
        ignoreDuringBuilds: true,
    },
};

export default nextConfig;
