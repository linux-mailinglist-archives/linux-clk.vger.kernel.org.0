Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D422357C8DA
	for <lists+linux-clk@lfdr.de>; Thu, 21 Jul 2022 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiGUKWE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Jul 2022 06:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbiGUKWD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jul 2022 06:22:03 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD8C31DF4
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 03:22:00 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id m13so1560443edc.5
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=coS9yaiFpBby2OfoSNqf9gzdn43j/VET3bvDzCGocjQ=;
        b=Mp9N6VNKLnN8XmfgQiRv9rTuCj42SfzQ2c8sm+Q4zjul0ZnDivBU+18O0OtxC6Jt0s
         zU0N0zdwI9gFuTa7L4UV9kRcXRKowCkUWZ6OzqrXaAe/FgcCWB66v9ffLDXcqOsIZKw6
         1WdIEqYiVhPj/+p8ZlrXwPQbZj80TJWfEGEz/GePz5xPimw1eF2KFR9TkIYfct9BDr3T
         6OImENbCB2AIdSzEdDCXRiiMVJHX+LeFsr2TQSf1EJ8jCKiwW8luqh02FoSC5lPNYOlb
         b9jnQn8aO7jvemtkeBJAYTcQGiPdHo5/5yVhiGN9auedKnRBIY943a0C/yteO+MmdnsG
         uHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=coS9yaiFpBby2OfoSNqf9gzdn43j/VET3bvDzCGocjQ=;
        b=wZ8s9MWDzxx/G8EW+rfnuKLzsVaaG8N3s0ZbB5MHWIKLslHDFqpkHiWHG7/Fv/lTBA
         I68ul7GgDUNgp93tl0GumEZGF10qDkBxS0egsWLbQpc99gGCBRXeK9SybJ4LT4/IXTSW
         xW3HCab19LTI8FxXeJ7ptIPDpGvV0On3oEvPjUaEdRVJwbqgcwne1fcZ8RKUfLxBRFJj
         R02X8JpIk9sU2IwDJWiAuIiVSsEA7KufAbI3krL5iEC3KzuGAM+2dJA3KhgZXmIOB6Tj
         Kd0/p9svavhMcYJelnOZ5uS9OfRoZoyhhnBUYEA2aUcoZQdmh9fbMgk9Ckdg4B0/SnZl
         4fug==
X-Gm-Message-State: AJIora82HU6Kz6oBJD0qyqBQ68RgAP3MG45bT0Ss5wNHZdDe54HM5fQZ
        6WSqZo96KMZFp/6OEt8Q60LRkAcIS6bW/8o127s=
X-Google-Smtp-Source: AGRyM1sEvIoGaleZ0I52UXafLlxTEwTkuYih/lWd0T125/PHxr4qeJe72V+MS07UNoptZgxQhg1wvWeO0sdco/fifnU=
X-Received: by 2002:a05:6402:5415:b0:43b:a888:fefe with SMTP id
 ev21-20020a056402541500b0043ba888fefemr11736690edb.302.1658398919275; Thu, 21
 Jul 2022 03:21:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f1d4:b0:72b:2fd6:a7db with HTTP; Thu, 21 Jul 2022
 03:21:58 -0700 (PDT)
Reply-To: cynthiawilliams777@hotmail.com
From:   Cynthia William <cw14445@gmail.com>
Date:   Thu, 21 Jul 2022 12:21:58 +0200
Message-ID: <CAD=7fZjM115kfhU30L18TFJGie4n5oeUyiqKiv7+ZDUWph+SfQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cw14445[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cw14445[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cynthiawilliams777[at]hotmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello, please I need to communicate with you,
Can I share words with you?

Cynthia
