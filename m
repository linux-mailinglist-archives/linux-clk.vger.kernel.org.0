Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD89315B4F7
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2020 00:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbgBLXme (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 18:42:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729133AbgBLXme (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 18:42:34 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB546206B6;
        Wed, 12 Feb 2020 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581550953;
        bh=aDIXDrOuDVnfZBdDmzMj/8qCWQ7ppuDAUa6MptrtWa4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F/ddA734VLDeuviplc+g1yxLVkTXsyLQCLM/reGVVYRislVBsCBOQquD51TVT/gn9
         dOUxPG3XKu3XtyDPnXFKAQ7aEdTfISe6dCBcB7uHnKF/pMadr4OjLeGnUqbtDp7zYp
         pSbQstCOOrqvGmlEzWAaZD+QHRIkVbRaxQW0zpic=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200114160726.19771-2-dinguyen@kernel.org>
References: <20200114160726.19771-1-dinguyen@kernel.org> <20200114160726.19771-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/2] clk: socfpga: stratix10: simplify paramter passing
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Wed, 12 Feb 2020 15:42:32 -0800
Message-ID: <158155095293.184098.607544486927424597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-01-14 08:07:26)
> Just pass the clock pointer structure to the various register functions.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
