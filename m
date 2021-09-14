Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E680740BB2B
	for <lists+linux-clk@lfdr.de>; Wed, 15 Sep 2021 00:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbhINWUK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Sep 2021 18:20:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235609AbhINWUJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:20:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 932226115B;
        Tue, 14 Sep 2021 22:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657931;
        bh=Z60ok01eefua5+Ef4EctBFxO37Bt6jJDaP6jyWkC2u0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i7SdWSd8d7CSX0lZP9g3/wdqWs1FyVjHyNhu9mMbmqBYzj9+CE20nfL8GsZpkMVAO
         rO1cf/8a6UKlXAty2UnudLlkH0TRPfbXO+I09tyWMqiYzrA/MHcxH6DxGm2hdPWWF3
         Bno8ftwcDPTwYDjmH72OelRBf+JlDojNlsB+WAfIlF7yiPVhZP7xhBkXeEV6PLYc3I
         sFQoBL5vd4Ad4EOXb5ztfNsGt3u6+0Oz8PA/MWGRGAa/2Wkzzfz6eR349GPFQ4llt9
         DLPmAKaYYcnucgmM1ZZ/4oC6ilhY3DGryqpoXNsDAuSHi0uIu6llIEpnJ1l9oxzO6Z
         KSCjiCNAu84VA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-11-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-11-chun-jie.chen@mediatek.com>
Subject: Re: [v3 10/24] clk: mediatek: Add MT8195 camsys clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 14 Sep 2021 15:18:50 -0700
Message-ID: <163165793044.763609.104075678117595652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:19)
> Add MT8195 camsys clock controllers which provide clock gate
> control for camera IP blocks.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
