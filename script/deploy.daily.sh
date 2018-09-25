
# 开发分支
DEV_BRANCH="competeStudy"

# 日常分支
DAILY_BRANCH="daily/0.0.25"

echo "进入日常分支: ${DAILY_BRANCH}"
git co "${DAILY_BRANCH}"

echo "拉取远程数据: ${DAILY_BRANCH}"
git pull origin "${DAILY_BRANCH}"

echo "合并分支${DEV_BRANCH}到${DAILY_BRANCH}"
git merge "${DEV_BRANCH}"

echo "npm run daily start ..."
webpack --config webpack.daily.config.js -p --define process.env.NODE_ENV='"production"' --progress --colors
echo "npm run daily over"

git add -A .

echo "git 提交"
git commit --all -m "git merge ${DEV_BRANCH} to ${DAILY_BRANCH} and npm run daily"

echo "来吧，手动推送到预发环境吧！"
#git push origin $DAILY_BRANCH

# echo "回到${DEV_BRANCH}分支"
# git co "${DEV_BRANCH}"

# echo "日常部署完成"

