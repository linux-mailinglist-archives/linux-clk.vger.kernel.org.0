Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A1C474C3E
	for <lists+linux-clk@lfdr.de>; Tue, 14 Dec 2021 20:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237523AbhLNTrA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Dec 2021 14:47:00 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:46199 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237527AbhLNTrA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 14:47:00 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CD3993F3BC;
        Tue, 14 Dec 2021 20:46:57 +0100 (CET)
Date:   Tue, 14 Dec 2021 20:46:56 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] Use "ref" clocks from firmware for DSI PLL VCO
 parent
Message-ID: <20211214194656.mayiy4xhcshjluwf@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210911131922.387964-1-marijn.suijten@somainline.org>
 <163165584152.763609.4056232270079096475@swboyd.mtv.corp.google.com>
 <20210918144038.6q352hzqopx7vvdu@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918144038.6q352hzqopx7vvdu@SoMainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

On 2021-09-18 16:40:38, Marijn Suijten wrote:
> On 2021-09-14 14:44:01, Stephen Boyd wrote:
> > Quoting Marijn Suijten (2021-09-11 06:19:19)
> > > All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> > > global name, most of which don't exist or have been renamed.  These
> > > clock drivers seem to function fine without that except the 14nm driver
> > > for sdm6xx [1].
> > > 
> > > At the same time all DTs provide a "ref" clock as per the requirements
> > > of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> > > that clock to use without relying on a global clock name, so that all
> > > dependencies are explicitly defined in DT (the firmware) in the end.
> > 
> > I can take this through clk tree if it helps avoid conflicts. There are
> > some other patches to sdm660.c in the clk tree already.
> 
> Might be useful to maintain proper ordering of these dependent patches
> but it's up to Dmitry and Rob to decide, whom I'm sending this mail
> directly to so that they can chime in.

Dependent patch [3] landed in 5.15 and [2] made it into 5.16 rc's - is
it time to pick this series up and if so through what tree?

Repeating the links from patch 1/2:
[2]: https://lore.kernel.org/linux-arm-msm/20210830175739.143401-1-marijn.suijten@somainline.org/
[3]: https://lore.kernel.org/linux-arm-msm/20210829203027.276143-2-marijn.suijten@somainline.org/

Thanks!

- marijn
