Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAB834F19B
	for <lists+linux-clk@lfdr.de>; Tue, 30 Mar 2021 21:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhC3TaJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Mar 2021 15:30:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14256 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbhC3T3r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Mar 2021 15:29:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617132587; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=a95vjplYANEQc1OBiqfteOvGXbi8z1BBsoYoWjdz7lo=;
 b=rtEht5P/ymzb96/1bsac69RfE0PhkkYQzGC7zFodM3ufPAhajU4zjkRQacKu25gDU6u4VOj+
 iRPVTh1R69KWl3g88q4QtF03ZnqKBrAIpWzxs/4O6JgPiBhH32B/ruIU+hoklR03cj4YwqwL
 KE4CjqA6Jj3JNoVZJfHn1qhGy94=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60637c2387ce1fbb56ecaacf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 19:29:39
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D3D26C43465; Tue, 30 Mar 2021 19:29:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65737C433CA;
        Tue, 30 Mar 2021 19:29:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 30 Mar 2021 12:29:36 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 25/25] drm/msm/dsi: stop passing src_pll_id
 to the phy_enable call
In-Reply-To: <20210327110305.3289784-26-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-26-dmitry.baryshkov@linaro.org>
Message-ID: <c5d51139810c5c6c941a71675ffc270b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-03-27 04:03, Dmitry Baryshkov wrote:
> Phy driver already knows the source PLL id basing on the set usecase 
> and
> the current PLL id. Stop passing it to the phy_enable call. As a
> reminder, dsi manager will always use DSI 0 as a clock master in a 
> slave
> mode, so PLL 0 is always a clocksource for DSI 0 and it is always a
> clocksource for DSI 1 too unless DSI 1 is used in the standalone mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                   |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c           | 11 +++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 +-
>  10 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 53feea9d30c0..c8ef63bdc042 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -162,7 +162,7 @@ struct msm_dsi_phy_clk_request {
> 
>  void msm_dsi_phy_driver_register(void);
>  void msm_dsi_phy_driver_unregister(void);
> -int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 0c47c5fb1ab3..76735cde57c6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -114,7 +114,7 @@ static int dsi_mgr_setup_components(int id)
>  	return ret;
>  }
> 
> -static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
> +static int enable_phy(struct msm_dsi *msm_dsi,
>  		      struct msm_dsi_phy_shared_timings *shared_timings)
>  {
>  	struct msm_dsi_phy_clk_request clk_req;
> @@ -123,7 +123,7 @@ static int enable_phy(struct msm_dsi *msm_dsi, int
> src_pll_id,
> 
>  	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
> 
> -	ret = msm_dsi_phy_enable(msm_dsi->phy, src_pll_id, &clk_req);
> +	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
>  	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
> 
>  	return ret;
> @@ -136,7 +136,6 @@ dsi_mgr_phy_enable(int id,
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>  	struct msm_dsi *mdsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
>  	struct msm_dsi *sdsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
> -	int src_pll_id = IS_DUAL_DSI() ? DSI_CLOCK_MASTER : id;
>  	int ret;
> 
>  	/* In case of dual DSI, some registers in PHY1 have been programmed
> @@ -149,11 +148,11 @@ dsi_mgr_phy_enable(int id,
>  			msm_dsi_host_reset_phy(mdsi->host);
>  			msm_dsi_host_reset_phy(sdsi->host);
> 
> -			ret = enable_phy(mdsi, src_pll_id,
> +			ret = enable_phy(mdsi,
>  					 &shared_timings[DSI_CLOCK_MASTER]);
>  			if (ret)
>  				return ret;
> -			ret = enable_phy(sdsi, src_pll_id,
> +			ret = enable_phy(sdsi,
>  					 &shared_timings[DSI_CLOCK_SLAVE]);
>  			if (ret) {
>  				msm_dsi_phy_disable(mdsi->phy);
> @@ -162,7 +161,7 @@ dsi_mgr_phy_enable(int id,
>  		}
>  	} else {
>  		msm_dsi_host_reset_phy(msm_dsi->host);
> -		ret = enable_phy(msm_dsi, src_pll_id, &shared_timings[id]);
> +		ret = enable_phy(msm_dsi, &shared_timings[id]);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 56f5134e3933..2a421fd77f2f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -753,7 +753,7 @@ void __exit msm_dsi_phy_driver_unregister(void)
>  	platform_driver_unregister(&dsi_phy_platform_driver);
>  }
> 
> -int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct device *dev = &phy->pdev->dev;
> @@ -776,7 +776,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> int src_pll_id,
>  		goto reg_en_fail;
>  	}
> 
> -	ret = phy->cfg->ops.enable(phy, src_pll_id, clk_req);
> +	ret = phy->cfg->ops.enable(phy, clk_req);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
>  		goto phy_en_fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 3b207cf9f6b4..74fffcae0f10 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -19,7 +19,7 @@
> 
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
> -	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
> +	int (*enable)(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_state)(struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 04535ccd11ef..bea68154ef87 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -786,7 +786,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	}
>  }
> 
> -static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>  			       struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7a87bed71e36..c9afa6c461ee 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -938,7 +938,7 @@ static void dsi_14nm_dphy_set_timing(struct
> msm_dsi_phy *phy,
>  		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
>  }
> 
> -static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
>  			       struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -996,7 +996,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
> 
>  	glbl_test_ctrl = dsi_phy_read(base + 
> REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
> -	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +	if (phy->usecase == MSM_DSI_PHY_SLAVE)
I think it should not make a difference but can we keep the check for 
DSI_1? So lets modify this to be:
if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_SLAVE)
>  		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index f5b88c85a8fc..e96d789aea18 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -63,7 +63,7 @@ static void dsi_20nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
>  }
> 
> -static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -85,7 +85,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
> 
>  	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
> -	if (src_pll_id == DSI_1)
> +	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_STANDALONE)
>  		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 9f83ab90d093..0e8f74ebb895 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -698,7 +698,7 @@ static void dsi_28nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  		dsi_28nm_phy_regulator_enable_dcdc(phy);
>  }
> 
> -static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -745,7 +745,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
> 
>  	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
> -	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +	if (phy->usecase == MSM_DSI_PHY_SLAVE)
same here
>  		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index d2bfe43c9ef1..104446450f7c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -585,7 +585,7 @@ static void dsi_28nm_phy_lane_config(struct
> msm_dsi_phy *phy)
>  	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
>  }
> 
> -static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 619998506b78..badc76a8d425 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -799,7 +799,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	}
>  }
> 
> -static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  			      struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	int ret;
