package handlers

import (
	"context"
	"github.com/gin-gonic/gin"
	"tiktok-server/cmd/api/rpc"
	"tiktok-server/internal/erren"
	"tiktok-server/kitex_gen/user"
)

// User 查询用户信息
func User(c *gin.Context) {
	var request user.UserRequest
	if err := c.Bind(&request); err != nil {
		BadResponse(c, err)
		return
	}

	if request.UserId <= 0 || len(request.Token) == 0 {
		BadResponse(c, erren.ParamErr)
		return
	}

	// gin 貌似没有配套上下文参数，暂时手动创建
	ctx := context.Background()
	resp, err := rpc.User(ctx, &request)
	if err != nil {
		BadResponse(c, erren.ConvertErr(err))
		return
	}
	SendResponse(c, resp)
}
