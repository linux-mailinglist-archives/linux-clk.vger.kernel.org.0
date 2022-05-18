Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A53652C0B0
	for <lists+linux-clk@lfdr.de>; Wed, 18 May 2022 19:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240472AbiERQrt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 May 2022 12:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240512AbiERQro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 12:47:44 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF4B49F84
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 09:47:27 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7F2A320537;
        Wed, 18 May 2022 18:47:25 +0200 (CEST)
Message-ID: <6cb75a3e-49fd-bbe0-4e81-d6aec33b70a5@somainline.org>
Date:   Wed, 18 May 2022 18:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 18/05/2022 12:35, Vladimir Zapolskiy wrote:
> Access to I/O of SM8250 camera clock controller IP depends on enabled
> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
> one is inited on subsys level, so, to satisfy the dependency, it would
> make sense to deprive the init level of camcc-sm8250 driver.

Hi,


I believe this is due to the fact that this clock is falsely advertised 
by the header and Linux does not know anything about it, because it is 
handled by a magic write [1] (as I once said in a similar case, this was 
going bite eventually..) instead and the index corresponding to the 
define symbol is not initialized, hence it points to NULL. Adding the 
clock properly in GCC would let the OF clock stuff handle it gracefully. 
If that is the case, your patch disabling the clock controller block 
(which I'm against unless there's abosolute need, as having the hw block 
initialized properly should be possible regardless of the board, as it's 
a generic SoC components) should not be necessary.

That said, I can not test my theory right now.


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/qcom/gcc-sm8250.c?h=next-20220518#n3647

Konrad

>
> If both drivers are compiled as built-in, there is a change that a board
> won't boot up due to a race, which happens on the same init level.
>
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..ae4e9774f36e 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
>   	},
>   };
>   
> -static int __init cam_cc_sm8250_init(void)
> -{
> -	return platform_driver_register(&cam_cc_sm8250_driver);
> -}
> -subsys_initcall(cam_cc_sm8250_init);
> -
> -static void __exit cam_cc_sm8250_exit(void)
> -{
> -	platform_driver_unregister(&cam_cc_sm8250_driver);
> -}
> -module_exit(cam_cc_sm8250_exit);
> +module_platform_driver(cam_cc_sm8250_driver);
>   
>   MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>   MODULE_LICENSE("GPL v2");
>
