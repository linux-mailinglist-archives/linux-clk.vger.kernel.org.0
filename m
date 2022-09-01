Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691025A949B
	for <lists+linux-clk@lfdr.de>; Thu,  1 Sep 2022 12:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbiIAK2e (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Sep 2022 06:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233980AbiIAK2c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 06:28:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2174D152
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 03:28:31 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1oThQq-0000YK-87; Thu, 01 Sep 2022 12:28:20 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1oThQn-0000Tb-NO; Thu, 01 Sep 2022 12:28:17 +0200
Date:   Thu, 1 Sep 2022 12:28:17 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Message-ID: <20220901102817.GB32271@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831104741.v6.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 31, 2022 at 10:48:24AM +0530, Akhil P Oommen wrote:
> Add a reset op compatible function to poll for gdsc collapse.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Minor update to function prototype
> 
>  drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h |  7 +++++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 44520ef..2d0f1d1 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -17,6 +17,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  #define PWR_ON_MASK		BIT(31)
>  #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>  	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>  }
>  
> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
> +		s64 timeout_us, unsigned int interval_ms)
>  {
>  	ktime_t start;
>  
> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  	do {
>  		if (gdsc_check_status(sc, status))
>  			return 0;
> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +		if (interval_ms)
> +			msleep(interval_ms);
> +	} while (ktime_us_delta(ktime_get(), start) < timeout_us);

Could this loop be implemented with read_poll_timeout()?

>  	if (gdsc_check_status(sc, status))
>  		return 0;
> @@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>  		udelay(1);
>  	}
>  
> -	ret = gdsc_poll_status(sc, status);
> +	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
>  	if (!ret && status == GDSC_OFF && sc->rsupply) {
> @@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
>  		 */
>  		udelay(1);
>  
> -		ret = gdsc_poll_status(sc, GDSC_ON);
> +		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>  		if (ret)
>  			return ret;
>  	}
> @@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +int gdsc_wait_for_collapse(void *priv)
> +{
> +	struct gdsc *sc = priv;
> +	int ret;
> +
> +	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
> +	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);

Superficially, using this as a reset op seems like abuse of the reset
controller API. Calling reset_control_reset() on this in the GPU driver
will not trigger a reset signal on the GPU's "cx_collapse" reset input.

So at the very least, this patchset should contain an explanation why
this is a good idea regardless, and how this is almost a reset control.

I have read the linked discussion, and I'm not sure I understand all
of it, so please correct me if I'm wrong: There is some other way to
force the GDSC into a state that will eventually cause a GPU reset, and
this is just the remaining part to make sure that the workaround dance
is finished?

If so, it should be explained that this depends on something else to
actually indirectly trigger the reset, and where this happens.

regards
Philipp
