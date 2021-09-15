Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF69A40BD11
	for <lists+linux-clk@lfdr.de>; Wed, 15 Sep 2021 03:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhIOBUW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Sep 2021 21:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhIOBUQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:20:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDECF61164;
        Wed, 15 Sep 2021 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631668738;
        bh=Ep7dpwNLvWS/XSOlcbh/76uwD/xBXYbFTdnOF2nbAHE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PKUOEW6wT/1yVl4eQr0trslcLrVYiOAwkLQvF1Hk4XMUyPP5l6jO1yADfLLBm53+W
         L9xm492IlQJSn62/2wYb5IkUWTqB0iYB4uZSeGY/AAoem9oHXlBFtVdWW9tlwSP+fl
         OvIWqBgI5ZRPPCCskG59UXON7BB1Nl3uhV9bmqKVk2VntXVj7y2RW3pklj/7VVp2u5
         lr/N/Q4KaOUbe+3q6vb04yU1ZTvQH1sKSfp4q4Ez4k1IDg9rZgLbczmjldhKhPFdb6
         1/+DMAdkJ8UQbbFmB9MXcQcQw4kEXw8KhrJLc08Y5/SwaTqdpaCUIjEYxQCkzaaMHd
         uHqDVkMAz+WLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210903152615.31453-1-kabel@kernel.org>
References: <20210903152615.31453-1-kabel@kernel.org>
Subject: Re: [PATCH] dt-bindings: clk: fixed-mmio-clock: Convert to YAML
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jan Kotas <jank@cadence.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>
To:     Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>,
        linux-clk@vger.kernel.org
Date:   Tue, 14 Sep 2021 18:18:57 -0700
Message-ID: <163166873752.763609.1498318431763013146@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Beh=C3=BAn (2021-09-03 08:26:15)
> Convert the binding documentatoin for fixed-mmio-clock to YAML.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---

Applied to clk-next
