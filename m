Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219814A81E1
	for <lists+linux-clk@lfdr.de>; Thu,  3 Feb 2022 10:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349257AbiBCJuO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Feb 2022 04:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbiBCJuN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Feb 2022 04:50:13 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186A8C061714;
        Thu,  3 Feb 2022 01:50:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id BB3991F4530F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643881809;
        bh=wG8BggyvUnPyNwJcUMTw/jTZbCemTy5ML6h8AjCbA/4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OLQWfozTkWVpx3mYvAVzByx6RgaZnIHGP0yRC4h10PdJjIlSRSeV5+C5RvWwzlWTE
         xjfRHXlqgEl7uxHKy9vMh7tO8+gKZcL+ARrQPsebQRtCHxpROVKl2b/NvW7FY8aj55
         5uRBgDnaoyS9JuP+JPK6OEHNGkZY/Xt0qfN8omsSf3zRaW3/AsYuIrr+dBXiVydj3U
         e3BPqIeWt6MrsiwCgRfqbJry4jqhX1ZQdh4CbFQBArAN7fcJsCm8xCv5UDUQAOQO69
         lQK4ubkoS6cvxg/CU7HQ1IIgMr2PC8JQty3hH+aLnGWzenRhZjrWZF6Ayl5S6GObZy
         mdBpXjdav4nTA==
Message-ID: <5255793b-6972-83ba-384d-c09797034a56@collabora.com>
Date:   Thu, 3 Feb 2022 10:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-19-wenst@chromium.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-19-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> mtk_clk_register_composites(), as the name suggests, is used to register
> a given list of composite clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

