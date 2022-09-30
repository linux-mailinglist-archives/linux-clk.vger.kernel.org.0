Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B05D5F13D8
	for <lists+linux-clk@lfdr.de>; Fri, 30 Sep 2022 22:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiI3Unk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Sep 2022 16:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiI3Ung (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:43:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D197F1EDF72;
        Fri, 30 Sep 2022 13:43:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E34A6235D;
        Fri, 30 Sep 2022 20:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AEEC43470;
        Fri, 30 Sep 2022 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570614;
        bh=5pwyNqIBfDQPIsRDvz18i9ZiPLeoqKKMFJ4a1zJRijo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sEv+viHXPX/9jXaq9d5VqXCLlP9SY1p2MHsGds6myxAM+Tb7rrX++6IUejGRKWwgi
         QAvInlzE2rd+uZZE+Ql0T0g+F7dSI+/haZXTmZ3PiXfVTJ1IkBfpj9jJt0SfcM1weV
         QwxXgddgOh3m3KhHeVWIKWXWWYS9GCvXLv2wYscSafj5mfZ1Wcz5OBbaZ5JfoHamr0
         ahZgOrYU02my6yceu6dDEReKEkI5L2QwZIliBzNQDe3IBmhsFcdKbwdK6Jyj6+Aggl
         1Foi+HqrP3Bm+e9AtoFB3FV5f/jAFWqn2q5nMtNOpmvVpAQlIMJr21novLzBKF1J6w
         HdgDQFcnhuI7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-2-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-2-doug@schmorgal.com>
Subject: Re: [PATCH 01/12] clk: mmp: pxa168: add additional register defines
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:43:32 -0700
User-Agent: alot/0.10
Message-Id: <20220930204334.93AEEC43470@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:26)
> In preparation for adding additional peripherals over time, this commit
> adds a bunch of extra APBC_* defines based on information from the
> datasheet. It also reorganizes the list of defines to be ordered
> sequentially by address (grouped by type).
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
