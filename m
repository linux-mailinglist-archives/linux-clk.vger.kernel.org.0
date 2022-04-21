Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92197509BC2
	for <lists+linux-clk@lfdr.de>; Thu, 21 Apr 2022 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387294AbiDUJKc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Apr 2022 05:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387288AbiDUJKc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 05:10:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EE013F80;
        Thu, 21 Apr 2022 02:07:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 091361F45276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650532061;
        bh=Q3gSs0jXHQnQIkOYfBPlaxuHPudA0U/7l72NqP6ADKw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GW6dlLiWlWOixTnEGzpPVV719g8zBEr8Csp/gp0woqkyt/VHp6ei06aC8Pucd8kHT
         33mbXsidihBpo6LNkpqMB/MVkW20wvH2sJb72IZfcY4cC31cFxaExO0W8eiT38wJVU
         6ftkTZqtC5i7MdydUgIEX4RnPYVK8NiPP+S8+7JFPe/DYI4c1WSMIsyGmqmsH+yogE
         TWtFmnJbRfgsjuynT2CbMIQB58iHyRuI9aKzGBk6iwwihH5J3LbLYniPhJjKwWQNTn
         3a7LaEPlRufWajJwXlt1OFuOQW7oKvfttnuDifpDpe2oC2zPppSWnvJKNYhANUMYFk
         edXbEx4qZoeHA==
Message-ID: <36b46e3d-ddc0-d934-ce02-185d4aaf5790@collabora.com>
Date:   Thu, 21 Apr 2022 11:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 11/12] clk: mediatek: reset: Add infra_ao reset support
 for MT8192
Content-Language: en-US
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     matthias.bgg@gmail.com, p.zabel@pengutronix.de,
        chun-jie.chen@mediatek.com, wenst@chromium.org,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-12-rex-bc.chen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-12-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> The infra_ao reset is needed for MT8192. Therefore, we add this patch
> to support it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

