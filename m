Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4676D1D13
	for <lists+linux-clk@lfdr.de>; Fri, 31 Mar 2023 11:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjCaJy6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 31 Mar 2023 05:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjCaJyT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 05:54:19 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994C6975D;
        Fri, 31 Mar 2023 02:53:38 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B99126603194;
        Fri, 31 Mar 2023 10:53:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680256417;
        bh=JOF2O1/PMM/CO83ndiLN5FOdpyZy2/s+X+DPx1ZekhA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BRETWTbtoSd8kwZcRcjJyDM1yJD31hEXeSLVokGVBUtwJWm+qLYi6uX5rr+V0OCwc
         QC6gkUHWxUFXsxKZRcmFPs91rq5+5CxRrezMIOch4nTsT4tvUUzREouK1kdIO3kyY7
         IjUjzwPa0uTtNVefhe6rzNl8PFBBjw29GykffDaR4EOVlZQM9xZXUrUG2PVvtyhF44
         8tybh5Zi1IFpp+VpAbgtcEDsO3Bp3p5jQ1ZCn3YhTvMyKSb8UvBG5MdsSCW7qMQ6+Q
         wmdAwOakddNZxX1V+tOIHtxEVL02sMbT7u5SL7J6HbYRtMm5p0PAfx3pysPScwK4dy
         tzluITC7Qi/zA==
Message-ID: <40bcde9e-a7a0-b879-b838-ace98266e9fd@collabora.com>
Date:   Fri, 31 Mar 2023 11:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 17/19] clk: mediatek: Add MT8188 wpesys clock support
Content-Language: en-US
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-18-Garmin.Chang@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-18-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


