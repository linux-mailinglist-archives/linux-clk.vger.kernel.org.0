Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084D0592ECC
	for <lists+linux-clk@lfdr.de>; Mon, 15 Aug 2022 14:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiHOMUC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Aug 2022 08:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiHOMUB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 08:20:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB53B2654E
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 05:19:59 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bu15so367436wrb.7
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Cb0QvKMoKu2xzU2m5fn8KpdSBP1r0jNnjaCG9BaoJf8=;
        b=f+PqK1yxoLrzKdv8s2Gx0dw1GGRi6kzs2WtESzUBUGQG7gNf8/5tPqz5d6f0l+0Ky6
         7ndLFsBkewX2QTK2z0l3UYTB2sYOin1HS0/9taL7mPO08fZK3Ju66PG/VFHq94m2oaF+
         xVn2KK9BpqqxxaBq8/HQSQPgTz8TLhYBRrgAI0TAzDciDdidR9yGAx1Vb+KW/jTmVTvW
         35zTA2WK3EaDTcXPDxVeqvlGQPHGM5mhZocrw0Lv8IHEB6LzqY7dlPwJ/CKQch2sTKkE
         wehf/6PQ3X71Wj4IIRU+XYRTJGVM6u4iK8XAGfIHRuquPeHL2hFylVMgyUdwkXpDILqd
         vDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Cb0QvKMoKu2xzU2m5fn8KpdSBP1r0jNnjaCG9BaoJf8=;
        b=fwm+KR8RUj5IZQ6n68jw7iChMZVcIGZQdM9pMqlNNZL2f6UT0YA5Vc1ZaV78N3Y4If
         Rd7PJkiTiqv8MuvHtKpNCdr3eqoQyaXz1LYUP/+7fLxlTk8c7zJAqmDkPzmOVyvmh/QT
         mA+D+7gAlRoKnjIBo1P1RuI0CzRQ2Mmv3mufIC1gwuTktTUxNpdFN41JFuDye/iPBq1Y
         l14XrDIdoYqMS146pC/rd+MgkBokjeVk/EoCy7oQyiRwx/6BJCrp1MRJgYIEBRERZBdC
         96HO3cGM7BXyLfjHTCTQi9AXH9gjVEb0C1nr9tzOtZIl41qI8Fu86z7kHxjwZmWg5DIr
         7l1w==
X-Gm-Message-State: ACgBeo2TjgRe7ppNzcubWufEaE8Qnm5BN4PiNycnx1Zmac37XNEiuAY+
        BFoA6WbD+luqfiakGywA/1U/VA==
X-Google-Smtp-Source: AA6agR5jpGzcnMVoqZ1w4ypUaJvlsmJvJ2YUHA0qHL2TGohWVGn+LfqxLQC+7LvF2t549pKJvp84Vg==
X-Received: by 2002:a5d:684e:0:b0:220:63df:3760 with SMTP id o14-20020a5d684e000000b0022063df3760mr8120665wrw.508.1660565998532;
        Mon, 15 Aug 2022 05:19:58 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b002205a5de337sm7084777wrq.102.2022.08.15.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 05:19:57 -0700 (PDT)
Date:   Mon, 15 Aug 2022 14:19:57 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
Message-ID: <20220815121957.hmdjsznp4zj2ijmh@blmsp>
References: <20220813083249.45427-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220813083249.45427-1-y.oudjana@protonmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Yassine,

On Sat, Aug 13, 2022 at 09:32:49AM +0100, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> This allows it to be used in drivers built as modules.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This change overlaps with my patch [1], I added export symbol for more
functions as it was necessary to build the mt8365 clock driver as a
module. I will rebase after this one was applied.

You already have two reviewed-bys, but if you need one more, here you go
;)

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

[1] https://lore.kernel.org/linux-mediatek/20220811084433.2598575-4-msp@baylibre.com/

> ---
> This patch was originally part of a series, and is sent alone now since
> it doesn't depend on the rest of it and can be applied directly:
> https://lore.kernel.org/linux-clk/20220519134728.456643-1-y.oudjana@protonmail.com/
> 
>  drivers/clk/mediatek/clk-gate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index 421806236228..0c867136e49d 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
>  
>  	return PTR_ERR(hw);
>  }
> +EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
>  
>  int mtk_clk_register_gates(struct device_node *node,
>  			   const struct mtk_gate *clks, int num,
> -- 
> 2.37.1
> 
> 
