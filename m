Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB9246E3EC
	for <lists+linux-clk@lfdr.de>; Thu,  9 Dec 2021 09:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhLIISJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Dec 2021 03:18:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41604 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhLIISG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Dec 2021 03:18:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B918CB823D0;
        Thu,  9 Dec 2021 08:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D771C004DD;
        Thu,  9 Dec 2021 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037671;
        bh=6Yk7bLxA7TVto6o9AUHQrOCVn9C9axS/cn+ySOpLGlo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=g4aOHsf5I/tVcOwe6D/Y40LB5FGM0pc+zDSvzLlmYKbaeGNCiI3YvwhHrN2ZFEtiK
         nlHrduOB/+hUC9ITANudBYWXP74fzjHd8rkta2kP1yKA9vhXt8OdIhODksPZB/kK8h
         Zyi5ZWPkJ2CQ8VcBaU/0lM29iJAL++/AwlhVjTXWxRm1DHJV59YAC7cSZVOx3wuW/A
         35yLVWnsOvOdX41d3pheudpb0UYkMFornNq1vJH9ffR/fWFdIMwddXHUwto0v9xFKa
         OK8TvTAG0erEncz1Mv8mhggW36wWfleI9VDnTP9MNZOIN3HUk4HYEeH/v3ANzfs0sx
         6Qxcp4Bs7dYIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-12-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-12-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 11/11] clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:14:30 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209081431.7D771C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:30)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
