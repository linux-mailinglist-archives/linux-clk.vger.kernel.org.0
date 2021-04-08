Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C1E3578DD
	for <lists+linux-clk@lfdr.de>; Thu,  8 Apr 2021 02:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhDHAQr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Apr 2021 20:16:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:42476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DD4C61028;
        Thu,  8 Apr 2021 00:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840997;
        bh=wJSrXrTzpei1mBC3fwTOVFo5kBJNtvSHM/udGs81E+4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U9xxwfEtY28yhzaq9Ts/XexPq/jeqdDjYvVt2l1GFh9+nr4xLJCsxDMmumRRsL70T
         gjci+s5y0igXcaqYmUqPX2ZDHiPE94Mb5b2aKhY5lPZe8eCpSuXtgYS1HdlIMYACpj
         BQpPL9z68I4O6X6fraudpaxL5paQRXn5F27KTnxhYCIl9HDWAqLqZDguENsvxWKnpM
         LZlCN3S42eFl36yFSme1Cr92sR1RklEVLkWPrUMp25aACxzouCrQve5KqU5NXz7gyZ
         WcBCAcS8vWG4+8jQF16UBKSMgMZV6RmmB74qXhypSwcqBx4IBc3oYMjiYSJhmyfBsi
         K5daFdBIagb+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-20-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-20-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 19/33] clk: qcom: gcc-sc7180: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:35 -0700
Message-ID: <161784099584.3790633.13460414294737507667@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:29)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
