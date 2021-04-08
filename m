Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C007D3578CB
	for <lists+linux-clk@lfdr.de>; Thu,  8 Apr 2021 02:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhDHAPt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Apr 2021 20:15:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:42142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D48461028;
        Thu,  8 Apr 2021 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840938;
        bh=aKzgNZL2+mCS3/c2cK5LUP9YbJZRDE5C4QnvXbOCbhA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qAdI1+4AJ4BqPsAHTN6RguEgDXRWg9JAur9grv6Okf4aqFgRpSgdlXV2IgQtCYomR
         x+S39nGnYZd0j2wKpAPcR0xoRprAEIX7PP6f0aT9lcvV80Sp4edE/iCBTDx3ZxlHbC
         pWqqCm9ovTyApiFDSCVNMoCF/y7R9hdxYsmwoFBJg1qQS2lq+7ZI9Zvn268Nf39O5j
         8cs3mCcg6+KEh099RKfXFC46UvL5kYD3jtafuDf1hhFm5IdOQithoLzRyEcRWzSGXL
         pSxOkMcDauBRDijt5mPodvxNoHDpuFlsau+xwyLrHvlYWQEnvNIePMkgHfxLYFFf30
         cndB7tp71ATLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-11-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-11-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 10/33] clk: qcom: videocc-sm8250: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:36 -0700
Message-ID: <161784093690.3790633.11106962319547059569@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:20)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
