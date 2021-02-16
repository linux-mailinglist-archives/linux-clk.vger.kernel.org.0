Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F8F31D1BD
	for <lists+linux-clk@lfdr.de>; Tue, 16 Feb 2021 21:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhBPUtf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Feb 2021 15:49:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230063AbhBPUtf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Feb 2021 15:49:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B19F464E7D;
        Tue, 16 Feb 2021 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613508534;
        bh=vd/hvZOdkTfGjczYzKFcyPWBLDtZx5DZuJct6ZkrXeY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PdaopceHZqMHaj30+ivr7oK/o0Z+tkasMWUnfgK9NaH3W+N7kIjE2/Q9AcgQZkxvN
         BWYY2eWpnXraKdjS3sIiuoypXx41wKGoObvM4SSz9BXtrWt4qttsmdDKitSbDGG3K5
         P91bTKvCjkBuGbCdA+9exMqLLawwLWxzCIorf7FQAxCIgvIvAq+9sobrzKI2qFicQx
         8Ln7Ktfhs8s+nywpSMSUzcdrM6cx1p22R3iAxzEXjSdeqgCA2godSCLdExAOlQwwvx
         osDtFOKYd+Bq5KXpi1K+RfkR8Dm/t6OHe1fdBWvPbug1yBV9zSbsEJftKAvq/q56fV
         OmlHxzzfwYq5g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210215115710.3762276-2-daniel@0x0f.com>
References: <20210215115710.3762276-1-daniel@0x0f.com> <20210215115710.3762276-2-daniel@0x0f.com>
Subject: Re: [PATCH 2/2] clk: mstar: msc313-mpll: Fix format specifier
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Tue, 16 Feb 2021 12:48:53 -0800
Message-ID: <161350853352.1254594.17240997324789428825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2021-02-15 03:57:10)
> The output dividers are unsigned int so the format specifier
> should have been %u not %d.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---

Applied to clk-next
