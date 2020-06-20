Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF69201FD3
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jun 2020 04:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731963AbgFTChq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Jun 2020 22:37:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731846AbgFTChq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 22:37:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A375022DBF;
        Sat, 20 Jun 2020 02:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620665;
        bh=USMJrv5TGJ58rLPTaSDBTx79oPvTVt+Fh0aaM/+J3xo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2Pi8MIn0NaW3UiS8w8draZe8ULWUy2RAduxjVV80wrCfJLjCYrStFrkKMBj+PN1cX
         bPbxc2SohBwO41prN+zhLnsRQCKSDyd80EgZMFzHgBL5kDqhayXkvSqT0sF4ZAR9Zz
         16V7lfe37y8WnHcsmwA4d4DVcauUHWF8duKvEN18=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616202417.14376-1-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: agilex: add NAND_X_CLK and NAND_ECC_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 19 Jun 2020 19:37:44 -0700
Message-ID: <159262066493.62212.8382323290185332150@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-06-16 13:24:15)
> Add the NAND_X_CLK and NAND_ECC_CLK clocks.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
