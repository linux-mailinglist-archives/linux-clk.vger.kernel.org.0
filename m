Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5563E443506
	for <lists+linux-clk@lfdr.de>; Tue,  2 Nov 2021 19:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbhKBSFI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Nov 2021 14:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbhKBSE7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Nov 2021 14:04:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE086C061205
        for <linux-clk@vger.kernel.org>; Tue,  2 Nov 2021 11:02:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h11so36320539ljk.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Nov 2021 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=VyoOlx1f4bY9qJ0WEn854eIaH9saJD/psl6FGa9mBmM=;
        b=pMvwuX2WUAff1IBYhKTiMQfWaecynxsPLRATx7G5TcSA7MpirU6cOEjw4BXSZq/tCR
         D1+tVrvSfk6B1vBgeNkfmJ7EPJkr80bCooyJm5IjYImpr0I7RKu8K9as48ONYlOB9Bze
         H4EJqHymqNboBU0SxXO8ORlLHELyJVH1eab3jLwUD9N7b9xAw2z6BMdVUk4bKQrz81HS
         XDQwa6M49B3f5i86txLPYUJJAeLUI8yNEWZuQ7xXqvMYlQ7cK+xugj0GQb+AaGqFGgzZ
         7nBbES/3AqWN0Z4lP5Zhnfjmx7sZcu5ph4rAjEwDaPREPZQY0OE4q3KNHHvQtqXyBnzt
         6dlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=VyoOlx1f4bY9qJ0WEn854eIaH9saJD/psl6FGa9mBmM=;
        b=nmGiXFPL1IWSPo1WxAbs2LRC3S6xVarYgks3eh8FKBkOalkXHX93ZTYrKfSuzuZ61q
         1DZ03itdnRU7iHvLSEdVacD4XWDKhzBev9jZCKftR0CGEBnG5P2YeQdexCpZyTDGq6i1
         60FhUcEglD4IHIza9MlMAbPlYxYatxD/u9n58HmlXO0xEcCQPT7J0J6yH0rlmw3HCOEj
         W3lm8LswZnQd7CbZVE+dJ1QN+TNyBtoJHGhOuVixlL7lwLPl2kAUj/m526HsME9ONd0u
         36ouSB0ELHlmlHRGZlPUBR3oIUEoTzV4UQhU+6d0mfSLtb3t/U08XbZ2PrslUouM2+ow
         j+aA==
X-Gm-Message-State: AOAM530Sp/qhzt42/E9ABYJSAfG5WzqVYqS1cxHoyXfHs5B87wBc6xQP
        +upNLX630B+2A9kbp5rwgfjdHdlbAhIJ7Pdxr60=
X-Google-Smtp-Source: ABdhPJy5jm9MtYd0GPC8ydkh2aaXU+Dn5obOMlCYzpmvMGWtw0L1yRfk/Jbf0XwWQfEp1mM2p21JclYRNP9/uTZ491Q=
X-Received: by 2002:a2e:878c:: with SMTP id n12mr1534325lji.404.1635876141945;
 Tue, 02 Nov 2021 11:02:21 -0700 (PDT)
MIME-Version: 1.0
Sender: smithwilson780@gmail.com
Received: by 2002:a2e:5811:0:0:0:0:0 with HTTP; Tue, 2 Nov 2021 11:02:21 -0700 (PDT)
From:   DINA MCKENNA <dinamckennahowley@gmail.com>
Date:   Tue, 2 Nov 2021 18:02:21 +0000
X-Google-Sender-Auth: ZXkHNEhbol_nSwb_z8GBP5l3s1c
Message-ID: <CADh0myt+1skQ3DVWtqRq-vuZqs3ZEDUJ3H3-ck_hu460i1UzrA@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello my dear ,

 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs. Dina Mckenna Howley., a widow. I am
suffering from a long time brain tumor, It has defiled all forms of
medical treatment, and right now I have about a few months to leave,
according to medical experts. The situation has gotten complicated
recently with my inability to hear proper, am communicating with you
with the help of the chief nurse herein the hospital, from all
indication my conditions is really deteriorating and it is quite
obvious that, according to my doctors they have advised me that I may
not live too long, Because this illness has gotten to a very bad
stage. I plead that you will not expose or betray this trust and
confidence that I am about to repose on you for the mutual benefit of
the orphans and the less privilege. I have some funds I inherited from
my late husband, the sum of ($ 11,000,000.00, Eleven Million Dollars).
Having known my condition, I decided to donate this fund to you
believing that you will utilize it the way i am going to instruct
herein. I need you to assist me and reclaim this money and use it for
Charity works therein your country for orphanages and gives justice
and help to the poor, needy and widows says The Lord." Jeremiah
22:15-16.=E2=80=9C and also build schools for less privilege that will be
named after my late husband if possible and to promote the word of God
and the effort that the house of God is maintained. I do not want a
situation where this money will be used in an ungodly manner. That's
why I'm taking this decision. I'm not afraid of death, so I know where
I'm going. I accept this decision because I do not have any child who
will inherit this money after I die. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for.

I'm waiting for your immediate reply..

May God Bless you,
Mrs. Dina Mckenna..
