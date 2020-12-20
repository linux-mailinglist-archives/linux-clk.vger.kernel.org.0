Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937C22DF68F
	for <lists+linux-clk@lfdr.de>; Sun, 20 Dec 2020 19:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgLTSqY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Dec 2020 13:46:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:34482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgLTSqY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Dec 2020 13:46:24 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608489943;
        bh=7eSYram2H/tX8NdHtFAbDaTcFMwmrYRtTNEh0UVF9lg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fCUSJa8qWbQP04zIaVzxyQkBngyk0kFgZX5bNfl9aOkCfw4lvcP+gNWhJLUiDWjP2
         qOPbC9vyu5laeymUBCNusLJZyrKggEQawjgT4/as4ioX4nurxYujLSn5TiAV+Se95/
         eVOLP9EVNpjpQaGKZTCrh/UYTg5N3yKgHEYJl775N6D5sX6R7hmB2reS6dFf60c5SF
         /IwtObCg+YFopoJv/P3NKG7Fi02DHPw/NbFbNYvaTp5xk4tOQuyE+7NckylPI7opuE
         RSSWT/KdBNk26LdrOUdf1poHPwMwLvifWP/FdTUbzxVts8PThWt7mrNbA8UhNWGLrK
         Al8l09BeE13sw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201220085725.19545-2-damien.lemoal@wdc.com>
References: <20201220085725.19545-1-damien.lemoal@wdc.com> <20201220085725.19545-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Canaan vendor prefix
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>, linux-clk@vger.kernel.org
Date:   Sun, 20 Dec 2020 10:45:42 -0800
Message-ID: <160848994239.1580929.9790308606179584934@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2020-12-20 00:57:24)
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
> vendor of the Kendryte K210 RISC-V SoC.
>=20
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
