Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266CD2218BE
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jul 2020 02:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgGPAVe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jul 2020 20:21:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgGPAVe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jul 2020 20:21:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCFC2206F5;
        Thu, 16 Jul 2020 00:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594858893;
        bh=Vt4ogd1MXqn4WliMWsvNhwy7fFbOEakTp/toAzORy7A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NMnBE9eX8Ww5TVXl7UEiF/UAYemLqd6lx3iCzEREU39iw/z9HJ0W8KfFcj13rRb7a
         wVOA4fXbkogGwhpBv9LKIUm3ytg2ltq18YDjAWxNOO/SMbISAANhyeoakt27G4e2Zc
         hZFoSu2pHKKZrMFECa/IigZbQwDnV54dAcRiUjO8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f304b312-8034-5838-4ffc-e0fcbe8136b1@codeaurora.org>
References: <202007121820.EgK6NAy4%lkp@intel.com> <f304b312-8034-5838-4ffc-e0fcbe8136b1@codeaurora.org>
Subject: Re: [clk:clk-qcom 13/14] drivers/clk/qcom/gcc-ipq8074.c:4610:30: warning: initializer overrides prior initialization of this subobject
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        clang-built-linux@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        kernel test robot <lkp@intel.com>
Date:   Wed, 15 Jul 2020 17:21:32 -0700
Message-ID: <159485889297.1987609.17837106237884387966@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-07-12 22:47:22)
> Hi Stephen,
>=20
> I see that you already applied this patch on clk-next,
>=20
> shall I provide the fix as incremental patch?

Yes.
